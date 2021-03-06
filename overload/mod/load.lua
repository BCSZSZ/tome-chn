-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2016 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

-- Configure Map
--dofile("/mod/map_config.lua")

--------------------------------载入汉化文件

require "data-chn123.stat_name"
require "data-chn123.talent_name"
require "data-chn123.talent_type_name"
require "data-chn123.talent_type_description"
require "data-chn123.zone_name"
require "data-chn123.objects.object_use"
require "data-chn123.objects.object_desc"
require "data-chn123.objects.object_detail.objects"
require "data-chn123.linesplit"
require "data-chn123.tooltips.grids"
require "data-chn123.tooltips.traps"
require "data-chn123.tooltips.actors"
require "data-chn123.tooltips.projectiles"
require "data-chn123.lore_list"
require "data-chn123.quest"
require "data-chn123.time_effects"
require "data-chn123.achievements"
require "data-chn123.npc_name"
require "data-chn123.fly_text"
require "data-chn123.logs"
require "data-chn123.utf8"
require "data-chn123.elixir_ingredients"
require "data-chn123.dialogs.dialogs"
require "data-chn123.emote"
require "data-chn123.death_note"
require "data-chn123.randomboss_name_scheme"

require "data-chn123.log_name"
require "data-chn123.birth.birth"
require "data-chn123.texts.texts"
require "data-chn123.damage_type"
require "data-chn123.tinkers.tinker"
package.loaded["engine.ui.Dialog"] = require "data-chn123.dialog"
engine.ui.Dialog = require "data-chn123.dialog"
function chn123_tome_font()
	return config.settings.tome.show_spaces and "/data-chn123/font/main_spaced.ttf" or "/data-chn123/font/main.ttf"
end
--------------------------------END

-- Entities that are ASCII are outline
local Entity = require "engine.Entity"
Entity.ascii_outline = {x=2, y=2, r=0, g=0, b=0, a=0.8}

-- This file loads the game module, and loads data
local UIBase = require "engine.ui.Base"
local Level = require "engine.Level"
local FontPackage = require "engine.FontPackage"

-- Init settings
dofile("/mod/settings.lua")
if config.settings.tome.gfx and config.settings.tome.gfx.tiles == "ascii" then
	dofile("/mod/class/AsciiMap.lua")
end
local Map = require "engine.Map"

-- Apply some settings
Map.smooth_scroll = config.settings.tome.smooth_move
Map.faction_danger2 = "tactical_danger.png"
Map.faction_danger1 = "tactical_enemy_strong.png"
Map.faction_danger_check = function(self, e, max) return (not max and e.rank > 3) or (max and e.rank >= 3.5) end
Level.remove_old_entity_on_duplicate = true

-- Dialog UI
UIBase:changeDefault(config.settings.tome.ui_theme3)
UIBase:setTextShadow(0.6)

FontPackage:loadDefinition("data-chn123/font/packages/default.lua")
-- Dialogs fonts
--if config.settings.tome.fonts.type == "fantasy" then
	local size = ({normal=16, small=12, big=18})[config.settings.tome.fonts.size]
	UIBase.font = core.display.newFont(chn123_tome_font(), size)
	UIBase.font_bold = core.display.newFont(chn123_tome_font(), size)
	UIBase.font_mono = core.display.newFont(chn123_tome_font(), size)
	UIBase.font_bold:setStyle("bold")
	UIBase.font_h = UIBase.font:lineSkip()
	UIBase.font_bold_h = UIBase.font_bold:lineSkip()
	UIBase.font_mono_w = UIBase.font_mono:size(" ")
	UIBase.font_mono_h = UIBase.font_mono:lineSkip()+2
--[[else
	UIBase.font = FontPackage:get("default")
	UIBase.font_bold = FontPackage:get("bold")
	UIBase.font_mono = FontPackage:get("mono")
	UIBase.font_h = UIBase.font:lineSkip()
	UIBase.font_bold_h = UIBase.font_bold:lineSkip()
	UIBase.font_mono_w = UIBase.font_mono:size(" ")
	UIBase.font_mono_h = UIBase.font_mono:lineSkip()+2
end]]

local Savefile = require "engine.Savefile"
local KeyBind = require "engine.KeyBind"
local DamageType = require "engine.DamageType"
local Faction = require "engine.Faction"
local MapEffects = require "mod.class.MapEffects" -- This alters Map
local Tiles = require "engine.Tiles"
local InventoryUI = require "engine.ui.Inventory"
local ActorStats = require "engine.interface.ActorStats"
local ActorResource = require "engine.interface.ActorResource"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local ActorAI = require "engine.interface.ActorAI"
local ActorInventory = require "engine.interface.ActorInventory"
local ActorLevel = require "engine.interface.ActorLevel"
local Birther = require "engine.Birther"
local Store = require "mod.class.Store"
local WorldAchievements = require "mod.class.interface.WorldAchievements"
local PartyLore = require "mod.class.interface.PartyLore"
local PartyIngredients = require "mod.class.interface.PartyIngredients"
local PlayerHotkeys = require "engine.interface.PlayerHotkeys"
local Quest = require "engine.Quest"
Savefile:setSaveMD5Type("game")
Savefile:setSaveMD5Type("level")
Savefile:setSaveMD5Type("zone")

-- Define how quick hotkeys are saved
PlayerHotkeys.quickhotkeys_specifics = {
	function(a)
		local race = ((a.descriptor and a.descriptor.race) and a.descriptor.race or (a.type and a.type:capitalize() or "No Race"))
		local subrace = ((a.descriptor and a.descriptor.subrace) and (" (%s)"):format(a.descriptor.subrace) or (a.type and "" or " (No Subrace)"))
		return ("%s"):format(race .. subrace)
	end,
	function(a)
		local class = ((a.descriptor and a.descriptor.class) and a.descriptor.class or (a.subtype and a.subtype:capitalize() or "No Class"))
		local subclass = ((a.descriptor and a.descriptor.subclass) and (" (%s)"):format(a.descriptor.subclass) or (a.subtype and "" or " (No Subclass)"))
		return ("%s"):format(class .. subclass)
	end,
}


-- Create some noise textures
local n = core.noise.new(3)
_3DNoise = n:makeTexture3D(64, 64, 64)
local n = core.noise.new(2)
_2DNoise = n:makeTexture2D(64, 64)
--local n = core.noise.new(3)
--_2DNoise = n:makeTexture2DStack(64, 64, 64)

-- Achievements
WorldAchievements:loadDefinition("/data/achievements/")

-- Lore
PartyLore:loadDefinition("/data/lore/lore.lua")

-- Useful keybinds
KeyBind:load("chn_move,chn_hotkeys,chn_inventory,chn_actions,chn_interface,tome,chn_debug")

-- Additional entities resolvers
dofile("/mod/resolvers.lua")

-- Body parts
ActorInventory:defineInventory("MAINHAND", "In main hand", true, "Most weapons are wielded in the main hand.", nil, {equipdoll_back="ui/equipdoll/mainhand_inv.png"})
ActorInventory:defineInventory("OFFHAND", "In off hand", true, "You can use shields or a second weapon in your off-hand, if you have the talents for it.", nil, {equipdoll_back="ui/equipdoll/offhand_inv.png"})
ActorInventory:defineInventory("PSIONIC_FOCUS", "Psionic focus", true, "Object held in your telekinetic grasp. It can be a weapon or some other item to provide a benefit to your psionic powers.", nil, {equipdoll_back="ui/equipdoll/psionic_inv.png", etheral=true})
ActorInventory:defineInventory("FINGER", "On fingers", true, "Rings are worn on fingers.", nil, {equipdoll_back="ui/equipdoll/ring_inv.png"})
ActorInventory:defineInventory("NECK", "Around neck", true, "Amulets are worn around the neck.", nil, {equipdoll_back="ui/equipdoll/amulet_inv.png"})
ActorInventory:defineInventory("LITE", "Light source", true, "A light source allows you to see in the dark places of the world.", nil, {equipdoll_back="ui/equipdoll/light_inv.png"})
ActorInventory:defineInventory("BODY", "Main armor", true, "Armor protects you from physical attacks. The heavier the armor the more it hinders the use of talents and spells.", nil, {equipdoll_back="ui/equipdoll/body_inv.png"})
ActorInventory:defineInventory("CLOAK", "Cloak", true, "A cloak can simply keep you warm or grant you wondrous powers should you find a magical one.", nil, {equipdoll_back="ui/equipdoll/cloak_inv.png"})
ActorInventory:defineInventory("HEAD", "On head", true, "You can wear helmets or crowns on your head.", nil, {equipdoll_back="ui/equipdoll/head_inv.png"})
ActorInventory:defineInventory("BELT", "Around waist", true, "Belts are worn around your waist.", nil, {equipdoll_back="ui/equipdoll/belt_inv.png"})
ActorInventory:defineInventory("HANDS", "On hands", true, "Various gloves can be worn on your hands.", nil, {equipdoll_back="ui/equipdoll/hands_inv.png"})
ActorInventory:defineInventory("FEET", "On feet", true, "Sandals or boots can be worn on your feet.", nil, {equipdoll_back="ui/equipdoll/boots_inv.png"})
ActorInventory:defineInventory("TOOL", "Tool", true, "This is your readied tool, always available immediately.", nil, {equipdoll_back="ui/equipdoll/tool_inv.png"})
ActorInventory:defineInventory("QUIVER", "Quiver", true, "Your readied ammo.", nil, {equipdoll_back="ui/equipdoll/ammo_inv.png"})
ActorInventory:defineInventory("GEM", "Socketed Gems", true, "Gems worn in/on the body, providing their worn bonuses.", nil, {equipdoll_back="ui/equipdoll/gem_inv.png", stack_limit = 1})
ActorInventory:defineInventory("QS_MAINHAND", "Second weapon set: In main hand", false, "Weapon Set 2: Most weapons are wielded in the main hand. Press 'x' to switch weapon sets.", true)
ActorInventory:defineInventory("QS_OFFHAND", "Second weapon set: In off hand", false, "Weapon Set 2: You can use shields or a second weapon in your off-hand, if you have the talents for it. Press 'x' to switch weapon sets.", true)
ActorInventory:defineInventory("QS_PSIONIC_FOCUS", "Second weapon set: psionic focus", false, "Weapon Set 2: Object held in your telekinetic grasp. It can be a weapon or some other item to provide a benefit to your psionic powers. Press 'x' to switch weapon sets.", true)
ActorInventory:defineInventory("QS_QUIVER", "Second weapon set: Quiver", false, "Weapon Set 2: Your readied ammo.", true)
ActorInventory.equipdolls = {
	default = { w=48, h=48, itemframe="ui/equipdoll/itemframe48.png", itemframe_sel="ui/equipdoll/itemframe-sel48.png", ix=3, iy=3, iw=42, ih=42, doll_x=116, doll_y=168+64, doll_w=128, doll_h=128,
	list={
		PSIONIC_FOCUS = {{weight=1, x=48, y=48, subshift="left"}},
		MAINHAND = {{weight=2, x=48, y=120, subshift="left"}},
		OFFHAND = {{weight=3, x=48, y=192, subshift="left"}},
		BODY = {{weight=4, x=48, y=264, subshift="left"}},
		QUIVER = {{weight=5, x=48, y=336, subshift="left"}},
		FINGER = {{weight=6, x=48, y=408, subshift="left"}, {weight=7, x=124, y=408, text="bottom", subshift="left"}},
		LITE = {{weight=8, x=188, y=408, subshift="right"}},
		TOOL = {{weight=9, x=264, y=408, subshift="right", text="bottom"}},
		FEET = {{weight=10, x=264, y=336}},
		BELT = {{weight=11, x=264, y=264}},
		HANDS = {{weight=12, x=264, y=192}},
		CLOAK = {{weight=13, x=264, y=120}},
		NECK = {{weight=14, x=235, y=48, subshift="right", text="topright"}},
		HEAD = {{weight=15, x=150, y=35, subshift="left", text="bottom"}},
	}},
	alchemist_golem = { w=48, h=48, itemframe="ui/equipdoll/itemframe48.png", itemframe_sel="ui/equipdoll/itemframe-sel48.png", ix=3, iy=3, iw=42, ih=42, doll_x=116, doll_y=168+64, doll_w=128, doll_h=128,
	list={
		MAINHAND = {{weight=1, x=48, y=120}},
		OFFHAND = {{weight=2, x=48, y=192}},
		BODY = {{weight=3, x=48, y=264}},
		GEM = {{weight=4, x=264, y=120}, {weight=5, x=264, y=192}},
	}},
}

-- Ingredients
PartyIngredients:loadDefinition("/data/ingredients.lua")

-- Damage types
DamageType:loadDefinition("/data/damage_types.lua")

-- Talents
ActorTalents:loadDefinition("/data/talents.lua")

-- Timed Effects
ActorTemporaryEffects:loadDefinition("/data/timed_effects.lua")

-- Load Actor resources
dofile("/data/resources.lua")

-- Actor stats
ActorStats:defineStat("Strength",	"str", 10, 1, 100, [[力量属性影响你的角色的物理能力，提升力量
可以提高物理强度，提高使用重型武器造成的
伤害，提高物理豁免，同时提高你的负重量。]])
ActorStats:defineStat("Dexterity",	"dex", 10, 1, 100, [[敏捷属性影响你的灵巧和警觉能力，提升敏捷
可以提升精准，提升闪避，提升使用轻武器造
成的伤害。]])
ActorStats:defineStat("Magic",		"mag", 10, 1, 100, [[魔法属性影响你驾奴魔法能量的能力，提升魔
法可以提高你的法术强度，提升法术豁免和提
高其他魔法物品的使用效果。]])
ActorStats:defineStat("Willpower",	"wil", 10, 1, 100, [[意志属性是你的专注能力，提升意志可以提升
你的法力值、体力值、超能力值、精神力、法
术豁免和精神豁免。]])
ActorStats:defineStat("Cunning",	"cun", 10, 1, 100, [[灵巧属性提升你学习、思考和反应能力。提升
灵巧可以让你学习更多的技能，提升意志力，
提升精神豁免和暴击几率。]])
ActorStats:defineStat("Constitution",	"con", 10, 1, 100, [[体质属性影响你抵抗和承受伤害的能力，提升
体质可以提高你的最大生命值和物理豁免。]])
-- Luck is hidden and starts at half max value (50) which is considered the standard
ActorStats:defineStat("Luck",		"lck", 50, 1, 100, [[幸运属性影响你的角色在参与未知事件的幸运
度。它可以增加你的暴击率，以及你进入随机
Vault的几率……]])

-- Actor leveling, player is restricted to 50 but npcs can go higher
ActorLevel:defineMaxLevel(nil)
ActorLevel.exp_chart = function(level)
	local exp = 10
	local mult = 8.5
	local min = 3
	for i = 2, level do
		exp = exp + level * mult
		if level < 30 then
			mult = util.bound(mult - 0.2, min, mult)
		else
			mult = util.bound(mult - 0.1, min, mult)
		end
	end
	return math.ceil(exp)
end
--[[
local tnb, tznb = 0, 0
for i = 2, 50 do
	local nb = math.ceil(ActorLevel.exp_chart(i) / i)
	local znb = math.ceil(nb/25)
	tnb = tnb + nb
	tznb = tznb + znb
	print("level", i, "::", ActorLevel.exp_chart(i), "must kill", nb, "actors of same level; which is about ", znb, "zone levels")
end
print("total", tnb, "::", tznb)
os.exit()
--]]

-- Load tilesets, to speed up image loads
Tiles:loadTileset("/data/gfx/ts-gfx-npc.lua")
Tiles:loadTileset("/data/gfx/ts-gfx-object.lua")
Tiles:loadTileset("/data/gfx/ts-gfx-trap.lua")
Tiles:loadTileset("/data/gfx/ts-gfx-terrain.lua")
Tiles:loadTileset("/data/gfx/ts-gfx-talents-effects.lua")

-- Factions
dofile("/data/factions.lua")

-- Actor autolevel schemes
dofile("/data/autolevel_schemes.lua")

-- Actor AIs
ActorAI:loadDefinition("/engine/ai/")
ActorAI:loadDefinition("/mod/ai/")

-- Birther descriptor
Birther:loadDefinition("/data/birth/descriptors.lua")

-- Stores
Store:loadStores("/data/general/stores/basic.lua")

-- Configure chat dialogs
require("engine.dialogs.Chat").show_portraits = true

-- Inventory tabs
InventoryUI.default_tabslist = function(self)
	local tabslist = {}
	tabslist[#tabslist+1] = {image="inven_tabs/weapons.png", 	kind="weapons",		desc="All kinds of weapons",		filter=function(o) return not o.__transmo and (o.type == "weapon") end}
	tabslist[#tabslist+1] = {image="inven_tabs/armors.png", 	kind="armors",		desc="All kinds of armours",		filter=function(o) return not o.__transmo and (o.type == "armor") end}
	tabslist[#tabslist+1] = {image="inven_tabs/jewelry.png", 	kind="jewelry",		desc="Rings and Amulets",		filter=function(o) return not o.__transmo and (o.type == "jewelry") end}
	tabslist[#tabslist+1] = {image="inven_tabs/gems.png", 		kind="gems",		desc="Gems"		,		filter=function(o) return not o.__transmo and (o.type == "gem" or o.type == "alchemist-gem") end}
	tabslist[#tabslist+1] = {image="inven_tabs/inscriptions.png", 	kind="inscriptions",	desc="Infusions, Runes, ...",		filter=function(o) return not o.__transmo and (o.type == "scroll") end}
	if self.actor.can_tinker then tabslist[#tabslist+1] = {image="inven_tabs/tinkers.png", kind="tinker", desc="Tinkers", filter=function(o) return o.is_tinker end} end
	tabslist[#tabslist+1] = {image="inven_tabs/misc.png", 		kind="misc",		desc="Miscellaneous",			filter="others"}
	tabslist[#tabslist+1] = {image="inven_tabs/quests.png", 	kind="quests",		desc="Quest and plot related items",	filter=function(o) return not o.__transmo and (o.plot or o.quest) end}
	if self.actor:attr("has_transmo") then tabslist[#tabslist+1] = {image="inven_tabs/chest.png", kind="transmo", desc="Transmogrification Chest", filter=function(o) return o.__transmo end} end

	self:triggerHook{"Inventory:makeTabs", tabslist=tabslist}
	tabslist[#tabslist+1] = {image="inven_tabs/all.png", kind="all", desc="All", filter="all"}
	for _, t in ipairs(tabslist) do if fs.exists("/data/gfx/"..UIBase.ui.."-ui/"..t.image) then t.image = UIBase.ui.."-ui/"..t.image else t.image = "metal-ui/"..t.image end end
	return tabslist
end

class:triggerHook{"ToME:load"}

------------------------------------------------------------------------
-- Count the number of talents per types
------------------------------------------------------------------------
--[[
local type_tot = {}
for i, t in pairs(ActorTalents.talents_def) do
	type_tot[t.type[1] ] = (type_tot[t.type[1] ] or 0) + t.points
	local b = t.type[1]:gsub("/.*", "")
	type_tot[b] = (type_tot[b] or 0) + t.points
end
local stype_tot = {}
for tt, nb in pairs(type_tot) do
	stype_tot[#stype_tot+1] = {tt,nb}
end
table.sort(stype_tot, function(a, b) return a[1] < b[1] end)
for i, t in ipairs(stype_tot) do
	print("[SCHOOL TOTAL]", t[2], t[1])
end
]]
------------------------------------------------------------------------
return {require "mod.class.Game", require "mod.class.World"}
