local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_REALITY_FRACTURE",
	name = "实境撕裂",
	info = function(self, t)
		local dur = t.getDuration(self,t)
		local damage = t.getDamage(self,t)/2
		local nb = t.getNb(self,t)
		return ([[你强大的熵之力撕裂了时空，将这个世界与虚空相连。
当施放疯狂系法术时，你有30%%几率在相邻的空地里打开一个虚空裂口，持续%d回合。 它每回合将会对范围7内的一个随机敌人释放虚空轰击，造成%0.2f点暗影伤害和%0.2f点时空伤害。

你可以主动激活这个天赋来强制使得时空不稳定，在你周围创造%d个虚空裂口。]]):
		format(dur, damDesc(self, DamageType.DARKNESS, damage), damDesc(self, DamageType.TEMPORAL, damage), nb)
	end,
}

registerTalentTranslation{
	id = "T_QUANTUM_TUNNELLING",
	name = "量子隧道",
	info = function(self, t)
		local range = self:getTalentRange(t)
		local power = t.getPower(self,t)
		return ([[你短暂地在时空中打开一个通道, 传送到范围%d内的一个虚空裂口。这将摧毁那个虚空裂口，使你获得一个护盾，吸收%d点伤害，持续4回合。
		护盾吸收的伤害随法术强度提高而提高。]]):
		format(range, power)
	end
}

registerTalentTranslation{
	id = "T_PIERCE_THE_VEIL",
	name = "刺破境界线",
	info = function(self, t)
		local chance = t.getChance(self,t)
		local ndam = t.getNetherDamage(self,t)
		local tdam = t.getTemporalDamage(self,t)
		local dur = t.getDimensionalDuration(self,t)
		return ([[Pouring more energy into your rifts, you have a %d%% chance for each one to instead appear as a more powerful type.
#PURPLE#Nether Breach:#LAST# Fires a beam dealing %0.2f darkness damage at a random target in radius 10.
#PURPLE#Temporal Vortex:#LAST# Inflicts %0.2f temporal damage each turn to enemies in radius 4 and reduces their global speed by 30%%.
#PURPLE#Dimensional Gate:#LAST# Each turn has a 50%% chance to summon a voidling lasting %d turns, a fast melee attacker that can teleport.
The stats of your Void Skitterers will scale with your Magic stat and level.]])
		:format(chance, damDesc(self, DamageType.DARKNESS, ndam), damDesc(self, DamageType.TEMPORAL, tdam), dur)
	end
}

registerTalentTranslation{
	id = "T_DIMENSIONAL_SKITTER",
	name = "维度迅击",
	info = function(self, t)
		local range = self:getTalentRange(t)
		return ([[传送到范围10内的一个敌人处，并用你的尖牙攻击它，造成%d%%武器伤害。]]):format(t.getDamage(self, t)*100)
	end,
}

registerTalentTranslation{
	id = "T_ZERO_POINT_ENERGY",
	name = "零点能量",	
	info = function(self, t)
		local power = t.getPower(self,t)
		return ([[你从虚空深处汲取能量，让你的实境撕裂技能强化任何已存在的虚空裂口。
#GREY#Void Rift虚空裂口:#LAST# 造成 %d%% 点额外伤害， 并且投射物在半径1范围内爆炸。
#PURPLE#Nether Breach深渊裂隙:#LAST# 造成 %d%% 点额外伤害，并且连锁至3个额外目标。
#PURPLE#Temporal Vortex时空漩涡:#LAST# 造成 %d%% 点额外伤害， 增加1效果半径, 并且减速效果提高至 50%%.
#PURPLE#Dimensional Gate维度之门:#LAST# Voidling Skitterers虚空行者将会变得狂暴, 增加他们 %d%%的全局速度。]])
		:format(power, power, power, power)
	end,
}
return _M

