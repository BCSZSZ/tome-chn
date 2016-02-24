local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_GESTALT",
	name = "��ʽ��",
	info = function(self, t)
		return ([[�� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ȡ �� ���� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ǿ �ȣ� �� �� �� ʱ %d �㣬 0 �� �� ʱ 0 �㡣
		ʹ �� �� �� �� �� �� �� �� �� �� �� �� ���� Ϊ �� �� �� һ �� �� �� �� �� �� �� %d �� �� �� ǿ �ȡ�
		ʹ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� %d �� �� �� �� �� ����
		Ч �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):
		format(t.getMind(self, t), t.getSteam(self, t), t.getPsi(self, t))
	end,}

registerTalentTranslation{
	id = "T_IMPROVED_GESTALT",
	name = "ǿ����ʽ��",
	info = function(self, t)
		local shield_power = t.getShieldPower(self, t)
		return ([[ÿ �� �� �� �� ʽ �� �� �� ״ ̬ �� ʹ �� �� �� �� �� ʱ�� �� �� �� ȡ һ Щ �� �� �� �� ��	�� �� �� һ �� �� �� �� �ܡ�
		�� �� �� �� �� �� 3 �� �ϣ� �� �� �� �� %d �� ����
		Ч �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):format(shield_power)
	end,}

registerTalentTranslation{
	id = "T_INSTANT_CHANNELING",
	name = "˲������",
	info = function(self, t)
		return ([[˲ �� �� �� �� ʣ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� һ �� �� �� �� �� �� �ܡ�
		�� �� �� �� �� ʱ �� �� �� �� 3 �� �ϣ� �� �� �� �� �� %d%% �� �� �� �� �� �� �� �� �� ����
		�� �� �� �� ͬ �� %d%% �� �� �� �� �� �� �� �� �� �� �� ����
		�� �� �� �� Ҫ �� ʽ �� �� �� �� ״ ̬ �� �� һ �� �� �� �� �� �� �� ǿ �� �� ʽ �� �� �� �� ȴ �С�]]):format(t.getPower(self, t), t.getPsi(self, t))
	end,}

registerTalentTranslation{
	id = "T_FORCED_GESTALT",
	name = "ǿ����ʽ��",
	info = function(self, t)
		return ([[�� ʱ �� �� �� �� �� �� �� ʹ �� �� �� ʽ �� �� �� �� �� Χ �� �� 5 �� �� �� �� �ˣ� �� �� �� Ӱ �� %d �� �� �ˡ�
		�� ʽ �� �� �� �� ÿ �� �� Ӱ �� �� �� �� �� �� ���� �� ǿ �ȣ� �� �� ǿ �ȣ� �� �� ǿ �ȣ� �� �� ǿ �ȣ� %d �� �ϡ�
		�� �� �� �� �� �� �� �� �� �� �� ȡ �� �� �� ��Ч �� ÿ �� �� �� �� �� �� �� �� ˥ ������
		�� �� ֮ �⣬ �� 5 �� �� �� �� �� �� �� �� �� �� �� �� ֪ �� �� %d �� �� �� �� �
		Ч �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):format(t.getNb(self, t), t.getPower(self, t), t.getSenseRadius(self, t))
	end,}
