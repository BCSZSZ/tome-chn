

local jump = function(npc, player)
	npc:disappear()
	game:changeLevel(1, "orcs+cave-hatred")
end

newChat{ id="welcome",
	text = [[#LIGHT_GREEN#*���㿿��ʱ�����ϳ�������ǰ��վ����Լ����������߻����ſ��µĺڰ������ܸ��ܵ����ĳ��������ᾧ��*#WHITE#
@playername@. ��������̵�����! #{bold}#��ɱ����! ���������̵Ĺ�!#{normal}#
�� #{italic}#����#{normal}# �������Ľ�ָ��Ϊս��Ʒ!���ܸо������������ϡ��ó�����Ȼ�����ɣ���]],
	answers = {
		{"Ŷ~��ϲ���Ǹ�Ůʥ��ʿ���Ұ���ɱ���ĸо���!", action=jump},
		{"�����ұ���ѡ��; �ұ��뱣�� #{bold}#�ҵ�#{normal}# ����.", action=jump},
		{"����ν.", action=jump},
		{"ʲô?", action=jump},
	}
}

return "welcome"
