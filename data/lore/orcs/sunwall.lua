--------------------------------------------------------------------------
-- Sunwall Outpost
--------------------------------------------------------------------------

registerLoreTranslation{
	id = "sunwall-outpost-1",
	name = "指挥官特瑞尔日记的一页",
	lore = function()
		local male = false
		if world and world.majeyal_campaign_last_winner then male = not world.majeyal_campaign_last_winner.female end
		return [[我们做到了…我们终于做到了。尽管这主要是我们的]]..(male and "英雄" or "英雄")..[[的功劳，但结果是一样的：无论是东方和西方大陆，都再也不用担心兽人的威胁了。撕打兽人部落已经被完全粉碎，残余的生还者也都被关押了起来，我们的巡逻队四处扫荡他们的残兵败将。我们等待已久的来自西方的古老盟友终于现身，用大量的材料和人力来帮助我们，我们终于可以开始建设这片美丽的大陆。这是前所未有的胜利：太阳堡垒再也不是是瓦·埃亚尔上文明和希望的唯一堡垒了。

然而，尽管如此…

还有一小撮敌人存留了下来。那是一个小小的兽人部落，只有一个小镇的大小，却逃脱了我们救世主的愤怒……他们像是我们美丽花园中的杂草，虽然是星星之火，却也有可能产生燎原之势。比起他父亲对兽人的严酷报复，托拉克国王有着崇高的目的，想要在世人面前树立一个更好的榜样。但我对此深表怀疑，如果让他经历一下我们这么多年经历的苦难，他是否还会甘冒让兽人卷土重来的风险。联合王国根本不知道生活在兽人部落的恐惧下的生活是什么样的，他们随时可能把太阳堡垒夷为平地，把我们的头颅当做炫耀的奖杯。他们可以安全地躲在传送门后面，不需要担心他们家乡的亲人会经历和我们一样的恐怖，不知道我们这么多年来都是在为我们的生命而战斗。如果他们真的体验一下我们的生活…可以说，在整个大陆完全和平之前，他们绝对不会现在一样，让那些该死的兽人战俘在舒服的拘留营里吃好喝好的。

以太阳的名义……为什么至高太阳骑士要同意这种不平等的条约？我们已经战斗了这么多年了……

兽人的探子越来越接近边境了。他们每次逃跑回来之后都越来越大胆，来的次数也越来越多了。他们还没有和我们正式交战过，但是这也只是时间问题……我什么也不准做，只能呆呆地等在这里，看守着这个肮脏的小桥，而那群西方大陆人还在一个大陆之外安睡着。我们就这样什么也不做，呆呆看着被敌人划开的伤口，静静等着它感染化脓，因为那些人还要在本应包扎的地方系一个可爱的小蝴蝶结呢。]] end,
}

registerLoreTranslation{
	id = "sunwall-outpost-2",
	name = "一封写给前哨站队长约翰的信",
	lore = [[阁下，

兽人的举动一天比一天更加放肆起来了。我想你一定也已经看到了——他们的探子越来越近，他们锻炉的浓烟飘过山脉，伴随着铁匠锻打武器发出的叮叮之声，还有他们演习时发出的愤怒战吼……你真的还要遵循这种自杀性的条约，继续按兵不动，直到他们的剑穿透你的喉咙吗？
如果你能够…说你[i]看到了[/i]他们的袭击部队就行，我一定会替你证明的。按照法条，我们进行自卫是绝对合法的。既然我们都知道这场冲突是不可避免的，请你至少让我们获得突袭的战术优势，而不是他们。

指挥官特瑞尔]],
}

registerLoreTranslation{
	id = "sunwall-outpost-3",
	category = "sunwall",
	name = "一封写给指挥官特瑞尔的信",
	lore = [[特瑞尔，

我敬重你的爱国之心和你为保卫太阳堡垒做出的奉献，否则，我现在就已经把你的这份信直接交给艾琳女士了。这个条约给我们带来了什么，你对此到底有没有一丁点认识？你难道真的以为，光靠我们的力量，没有托拉克国王的帮助，我们可以这么快扫清四大部落的残余，而不是让它们的残部卷土重来，至少成为我们接下来几十年中的心腹大患吗？尽管我和艾琳女士在有关兽人是否应该有忏悔的机会上有所分歧，这个条约是我们从联合王国那里获得[i]巨量[/i]援助的最重要的保障。而这个国家，就在去年，还在被一群流窜的反魔法师极端分子引发的内乱所蹂躏。

我不想和你讲有关抗命、撒谎以及不服指挥的废话。因为第一，原理上你“只是”在建议我违反军纪而已；第二，我有更有价值的事情去做，而不是对你这个我[i]完全[/i]知道做错了什么的家伙，写一篇长篇大论的斥责。相反，我会直截了当的告诉你：再也不要给我弄出来这样的东西了，想也不要想。我会保留你的信件，如果你敢介入任何不恰当使用武力的行为，我就会把它作为证据提交。我相信你会当个聪明人。

-前哨站队长约翰]],
}

registerLoreTranslation{
	id = "sunwall-outpost-4",
	name = "一个大大的，有压花的信封",
	lore = [[#{bold}#致有关人士:#{normal}#
运送这份信件的机械装置无法被强制解码，因此，我们可以100%地确定，阅读这份信的你，将会是管理连接瓦·埃亚尔和克拉克半岛桥梁的团体的最高领袖。
与此同时，根据我们的观察气球得到的结果，这个组织具有发达的文化和高度的文明，由多个不同的种族组成，并且可以和我们进行友好谈判；
并且，那些兽人没有之前提到的任何品质，他们在克拉克半岛上的持续存在，存在直接导致或间接造成我们两个群体的无数困难和不愉快的情况；
鉴于此，在不久的将来进行合作，实现我们两种文明之间的长期和平，对我们双方都有利；
因而，谨在此代表我和我的种族，向你们进行自我介绍。

我是首席议员坦塔罗斯，我代表#{bold}#气之部族#{normal}#的人民；兽人在不使用一连串不礼貌的贬义词的时候，将我们叫做蒸汽巨人，而我们觉得这个名字很有趣而接受了它。克拉克半岛是我们的领土，在这些可恶的暴徒闯入之前，我们早就在这里和平地生活了几千年。我们曾经满足于让他们在半岛上不受欢迎的落后地区四处游荡，而我们居住在高处俯瞰他们，但是，一系列不幸的事件，让我们不得不出手。

我们有着#{bold}#远胜#{normal}#你们的技术，比其他任何种族都要令人印象深刻。我们的普通百姓，有着比你们国王更加豪华的器具。我们的军队有着可怕的军备，可以让没有经过训练的普通人与最精锐的弓箭手比肩，而经验丰富的射手有着匹敌最强大的大法师的射程和精度。我们的人民是强大的，即使是计算力量和体重的比例，也比你们任何人都要强壮，跟不用说我们高耸的身躯和你们战斗就像对待小孩一样。我们的国内物产丰盈，无所不有，大量的精工巧匠，善于制造服饰、珠宝和最优质的白酒，以及大量其他出口产品。可以说，你们这些矮小的人可以从我们这里得到无数的好处；我们唯一的诉求，就是希望克拉克半岛继续是#{bold}#我们自己#{normal}#的领土，并且，如果你们考虑到#{italic}#解决#{normal}#兽人问题的迫切性，就给我们一点物质和军事的援助吧。

我们应该亲自见面，更详细地讨论这个问题。我也可以借给你一件让我们远程交流的神器。请尽快回复这份信。

此致,
#{italic}#-坦塔洛斯#{normal}#]],
}

registerLoreTranslation{
	id = "sunwall-outpost-5",
	name = "指挥官特瑞尔日记的一页",
	lore = [[好吧。看来这么长时间都没人发现，这个半岛里还居住着一个在山中隐居的巨人文明。如果不是因为我们实在是兵源不足，真想让这些废物哨兵统统滚蛋。好吧，看来无意间，这个奇怪的机器把我当成了约翰队长、艾琳女士和国王托拉克……虽然原理上我大概有义务把这封信交给他们，不过，在和首席议员坦塔洛斯单独探讨过一次之后，我们都意识到，现在没有时间去通知他们了，摆在我们面前的就是一个不应该被浪费的天赐良机。

现在，从官方立场上，我们和联合王国都应该尽可能把抓到的兽人送进拘留营，而不能直接杀掉他们，这对我们这座前哨站的防守十分不利。官方的说法是，我们需要保持现状，继续坐视克鲁克部族不断增长的威胁，而不能够抢在他们集结兵力之前进攻他们的领地。按照官方的做法，我们什么都做不了，直到一切都为时已晚。但是……

#{italic}#官方地说，#{normal}#，既然我们之前根本就没有人发现他们，气之部族是不存在的。官方来说，如果一艘前往拘留营的联合王国的补给船，#{italic}#不幸#{normal}#被一群雇佣兵海盗拦下了，而它们#{italic}#正好#{normal}#避开了海军的巡逻路线，那真的只能说是#{italic}#太遗憾了#{normal}#。如果他们运送的武器和装备正好跑到了气之部族的手里，那也没有什么奇怪的。按照官方说法，我们从来没有离开我们的前哨站一步，只有一群传说中的巨人从山中出现，摧毁了克鲁克部族的家园，让他们被迫逃离。毕竟，我们什么也没有干，最多只是自卫地干掉那些冲向这座桥的难民而已。官方立场上，这场事件不会妨碍气之部族日后和联合王国和太阳堡垒的谈判，他们肯定不知道，我们居然还曾经有过想要活捉那些兽人的天真到可笑的计划，而且我们还帮助他们捍卫了对克鲁克部族领地无可争辩的主权。

非官方说法？我想我会#{italic}#好好享受#{normal}#这一切的。]],
}

registerLoreTranslation{
	id = "sunwall-outpost-6",
	name = "约翰日记上的一页",
	lore = [[艾琳，我的爱人…我开始担心，特瑞尔说的可能是对的，但我会坚守这座桥，绝不会背叛你的信赖。尽管如此，我还是会对即将到来的袭击充满警惕，如果这场战争真的不可避免，我也会准备先发制人。只要我还在这里，我绝对不会让任何兽人伤害你。我们会共同开启一个光明璀璨的未来，携起手，走向一个和平的新时代的黎明……尽管我也希望克鲁克部族也能成为这样的新时代的一份子，但是，我绝不会荣幸他们把这样的新世界置于危险之中。]],
}

--------------------------------------------------------------------------
-- Sunwall Outpost
--------------------------------------------------------------------------

registerLoreTranslation{
	id = "orcs-gates-morning-1",
	name = "托拉克国王的宣战书",
	lore = function() return [[(当你走近远古传送门，前面走来了一位传令官，他的手中拿着信封；他没有把信直接交给你，而是从稍远一点的距离朝你扔了过来，然后敬礼，退回了传送门的漩涡之中。信件上盖着联合王国的皇家印章。)

]]..(game.player.name)..[[……我想，我开始明白，你们为什么会要这么做了。一开始，我……说实话，比起惊讶我更多的失望。我以为向你的人民展示慈悲是一个正确的选择。我的父亲曾经被仇恨吞噬，而我以前相信，给你们兽人一个机会，你们会成为更好的人。如果你愿意与我们合作，我们可以共同把埃亚尔变成一个更加美好的世界。不管我的父母，我的盟国曾经告诉我们什么样的东西，我相信，兽人种族的心中，深深埋藏着一种潜能，和我们人类、半身人、精灵、矮人和食人魔一样，可以学习、成长，变得更加美好。

但是现在看来……你们的身上没有任何一点优点。因为我过去相信，像你们这样的人没有任何救赎和悔改的可能，这么多人献出了生命。我曾经以为，我们可以再给你一个机会。只要我们用绝对的仁慈对待你们，向你伸出友谊之手，而不是握拳轻轻把你们碾碎。你们就会向我们展示，除了盲目血腥的复仇之外，你们还有着更加美好的目标。

我再也不会犯同样的错误了。

你们清楚地向我展现，兽人的铁石心肠中什么也没有，只有对死亡和毁灭的无尽欲望。无论把多么美好的未来摆在你们的面前，你们都会毫不在意地舍弃，只为了屠戮那些希望这种美好未来成真的真诚理性的人。你告诉我们，我曾经试图克服的，加在你们身上的偏见，都是正确的。你告诉我，我父亲的唯一错误，就是做的还不够——只把你们兽人从一个大陆上扫除还远远不够。现在，你们的种族会从埃亚尔上灭绝——这场战争将会是不可避免的，因为无论我们多少次提出了和平的提案，你们都对此不屑一顾。直到现在……你让我明白了了你们行动的理由。既然你们狂躁得把其他所有人都当做对你们生存的威胁，那唯一合理的方法就是用同样的态度对待你们。

你们已经没有任何机会了。现在，我要给你们一件你们最向往的礼物：战争。在这座传送门外，是联合王国的雄兵。他们曾经因为仇恨和嫉妒而相互攻击，现在却结成了牢不可破的联盟。因为我们知道和平与合作的重要性，而你们这种卑劣的种族永远不会明白这件事。我们会在一片开阔的战场上等待你们，向你们展示我们团结的力量。埃尔瓦拉的永恒精灵准备了强大的法术，食人魔们高举他们的棍棒。来自德斯和最后的希望的半身人和人类也在场，他们千年的仇恨早已弥合，团结一致，手持弓箭和投石索，带领着高大的傀儡和炼金炸弹。钢铁王座的矮人和夏图尔的自然精灵，他们过去甚至不是我们的盟友，但是现在，他们知道了你们巨大的威胁之后，决心再也不会置身事外。我们的队伍中有着呼唤兽群的自然之力强大召唤师，和意志#{italic}#绝不#{normal}#动摇的热诚的展示。太阳堡垒的战士们也加入了我们。他们派出了一支精锐的战士来强化我们的战士，训练我们战士使用他们钻研多年的魔法技能，你们这些愚顽不化的野兽，将会成为我们王者之师的磨刀石。

我会亲自出现在我们光荣联盟的前线手持利剑，御驾亲征。我，公正之王托拉克，是清除了马基埃亚尔的兽人一族的狮心王图库纳王之子。我曾经四处奔走，希望救你们的种族免遭奴役和灭绝，现在，我只希望完成我父亲未竟的使命。如果我光荣战死，图库纳的光荣血脉就将在这里终结，这就是我所甘愿承受的赌注——不，#{italic}#万分期待#{normal}#的赌注，我所赌的将会是埃亚尔所有文明种族的命运，一劳永逸地将其解决。

你想要对我父亲的人民复仇，对吧，卑劣的杂种？#{italic}#来啊，有种来战啊！#{normal}#

（你承认，这是一个十分有诱惑力的提议……但是，考虑到你的族人的安全是首要的。你可不像贸然进入这样的圈套，门后是无数瞄准目标的联合王国的弓箭手和投石者，正准备逐个狙击从传送门里冒出来的每一个人。你摧毁了传送门，确保托拉克的军队不会成为你的威胁，也确保太阳骑士艾琳不再能够得到来自西方大陆的援助。现在，是时候利用这个短暂的机会，一劳永逸地解决掉太阳堡垒的部队了）]] end,
}

registerLoreTranslation{
	id = "orcs-gates-morning-2",
	name = "太阳骑士的报告",
	lore = [[艾伦女士，

我很抱歉，但我们恐怕只能空着手去见托拉克过忘了——有关那些走私贩子到底是怎么从我们眼皮子底下过去的，我们现在对此还是一头雾水。我们现在的唯一证据，就是有关巨魔帝国港口一带沙漠中发出的轰隆隆的声音，恐怕有人在地下修筑隧道。他们防守森严，没有联合王国的帮助，我们恐怕不能独立攻击那里。但是，也有可能这只是一群还没有被来自马基埃亚尔的英雄消灭的，布莱亚族群沙龙的活动导致的。即使使用探测魔法，我们仍然一无所获——一定是有人布置了某种反探测的魔杖，但是它们被藏得很好。我们根本不知道这种东西藏在广阔大陆的那些角落，以及有多少东西受到了它们的影响。我们可以唯一确认的是，它们大概是想办法启动了另一个远古传送门——我们唯一知道的一个就是晨曦之门的远古传送门，但我想我们的守卫也不至于无能到没有注意到有奴隶贩子和走私贩子在我们的城市里面晃悠。如果真的有这样的事的话，那么只能说，它们大概用了我们所见过的最强力的隐身魔法。

……或许，既然是隐身魔法，应该改成说“所还没见过的最强力的隐身魔法”？算了，管他呢。

不管怎么样，我建议向国王托拉克提议，向他那里送出几位日光裁判官，在他那边协助执行调查任务。不管这些家伙在东方大陆怎样逃避我们的侦查，他们大概没法在西方大陆这么做，或者因为回到了自己大陆而过于轻敌。正因如此，他们更容易在那里被抓到——我们可以帮助联合王国打击他们链条上最弱的一环，然后他们逃回马基·埃亚尔之后，让留在西方大陆的裁判官收拾他们。我并非不相信托拉克国王会信守他的承诺，尽全力阻止那些卑劣的伊格兰斯，避免再度引发日落大屠杀这样的惨剧，但是……好吧，就在联合王国的眼皮底子下，一个远古传送门祭坛出现在了黑市上，而这一切恐怕都归功于住在国王隔壁的一个半疯的炼金术师……我实在是不相信，他们有能力撕下那群带着自称“修复者”的组织佯装“温和”的假面具，揭露那群藏身其中的狂热恐怖分子的真面目。我想，既然那群家伙绝对是动真格的，而我们也必须全力以赴。]],
}

registerLoreTranslation{
	id = "orcs-gates-morning-3",
	name = "至高太阳骑士艾琳的日记",
	lore = [[这一切……发生在我面前的一切，是我在一生中都在恐惧的场景，但这一切仍然让我无比震惊。过去的几乎每一日，我都以为这一切很快就要到来……但直到去年，事情出现了变化。来自西方大陆的英雄，击败了四大兽人部落，只身勇探灼烧之痕，攻上巅峰之塔，与我一同与和我过去远远无法想象强大的敌人并肩作战，并亲自击败了他们，这一切都是我做梦也没有想到的场景。我们终于和我们失去已久的盟友团聚，那是由一位慷慨善良的国王领导的，一个和平而统一的马基埃亚尔。他们愿意全力帮助我们，指定了一个让兽人的威胁始终在我们控制之下的计划……回想起来，这一切就好像太阳缓缓从地平线上升起，仿佛要给瓦·埃亚尔带来和平的曙光，但紧接着，永恒的黑暗降临，就连最后闪烁的月光也被黑暗笼罩。我的爱人恐怕已经死了；曾经在我生命的黑暗中照耀多年的点点烛光，就这样熄灭在无尽的黑夜中。什么都没有了——所有过去的计划都被践踏了，所有过去的梦想都化为了泡影，所有过去照耀的希望，现在都变成了绝望——已经没有谁能指引我了。

为了我的战友，我必须成为他们希望的光芒。我必须振作起来，坚强，坚定，将我所有的任何一点微小的希望，一同分享给他们。这不仅是为了保持他们的士气。太阳堡垒独自对抗着这种无法抵挡的恐怖威胁，已经坚持屹立了数个世纪，这是我们胜利的最后希望和机会……要让他们相信，他们临死之前的最后的愿望，是希望他们的牺牲能够拯救我们所有人。我无比希望，至少有一个人的努力是没有白费的。

我唯一希望的是，在他自己的国家也走向毁灭之前，托拉克国王能够从兽人的身上吸取一点教训。我并不准备苛责他，他所做的一切都深切的扎根于他的智慧和仁慈……对一切其他种族来说，他做的都没有错。但兽人是一个唯一的例外，他们不配得到我们的任何仁慈。]],
}

registerLoreTranslation{
	id = "caves-hatred-1",
	name = "善意",
	lore = [[我曾为你挺身而出。我曾经那么多次原谅你，想给你更多时间，想给你想要的安全感，让你证明你不是那样充满恶意。我曾经原谅你让我们生活在恐惧中几个世纪的痛苦，原谅在你们屠刀下逝去的无数生命，因为我曾经以为，如果把我放在你的位置上，我也有可能会做出同样的选择。

现在看吧，看看我的善意和仁慈给我换来了什么。]],
}

registerLoreTranslation{
	id = "caves-hatred-2",
	name = "希望",
	lore = [[你夺走了我的一切。你夺走了美好未来的曙光，你夺走了希望和幸福的火花，你夺走了我爱人艾琳身上善良的指引之光，熄灭了这份我们应得的美好的生命之光。光芒熄灭了……而你还给我们的，则是无尽的黑暗。现在，该由你来亲身体会一下这份黑暗了。请你好好享受一下，我们所经历的一切吧……我过去曾经感受到过这种力量，但我没有这样彻骨的仇恨来作为它的燃料，没有切身的痛苦亲自注入灵魂之中，没有那份我胸中无限的虚空，足以熄灭一切希望和渴求。现在，我可以轻松的使用这种力量了。是你亲自纠正了我。

我的心脏还在跳动，但你已经夺走了我生命的一切。你很快就会尝到这一切的感受的。]],
}

registerLoreTranslation{
	id = "caves-hatred-3",
	name = "痛苦",
	lore = [[沉沦吧。痛苦吧。失去一切驱使你的希望，包括你可憎心灵的一切野蛮的本能吧。请好好感受一下你给我带来的痛苦，直到这一切的痛苦都永远，永远不会停止……你能感受到，这正在一点点侵蚀着你继续前进的意志，对吧？

我会看着你的心灵一点点被你所给予我的痛苦摧垮，然后将其掌握在我的手中。我会稍微返还给你一点点我所夺走的希望与爱，让你成为困在你躯壳中的无力的囚徒。这样，我就可以亲自看着你的心灵的光芒一点点熄灭，你残留的躯壳，将会亲眼看着你所珍惜的人，被我缓慢而痛苦地亲手杀死。他们最后的遗言，将会是绝望诅咒你的名字，而你只能无能为力地看着这一切发生，无法阻止，知道这都是因为你的过错，因为你没能早点阻止这一切的发生。

这样，只有经过这样，你才会真正明白，你对我所做的一切对我意味着什么。]],
}
