local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_CONDENSATE",
	name = "����",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[�� �� �� �� �� �� �� %d �� �� �� �� �� �� ���� �� �� �� �� �� %0.2f �� �� �� �� �� �� ʪ �� �� 4 �� �ϡ� �� �� ʪ �� �� �� �� �� �� �� �� �� �� �롣
		�� �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):
		format(self:getTalentRadius(t), damDesc(self, DamageType.FIRE, damage))
	end,}

registerTalentTranslation{
	id = "T_SOLIDIFY_AIR",
	name = "�̻�����",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[�� �� �� �� �� �� �� �� ǰ �� �� ׶ �� �� �� �� �� �� �� �� �� �� �� ̬��
		�� �� �� �� �� �� �� �� �� �� �� �� �� %0.2f �� �� �� �� ����
		�� �� û �� �� �� ռ �� �� �� �� �� �� �� �� �� �� ռ ���� �� · %d �� �ϡ�
		�� �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):
		format(damDesc(self, DamageType.PHYSICAL, damage), t.getDur(self, t))
	end,}

registerTalentTranslation{
	id = "T_SUPERCONDUCTION",
	name = "����",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[�� �� һ �� �� �� �� �� �� �� Ŀ �꣬ �� �� %0.2f �� %0.2f �� �� �� ����
		�� �� Ŀ �� �� �� ʪ �ˣ� �� ô �� �� �� ɢ�� �� �� �� %d �� �� �� �� �� �� λ �� �� ͬ �� �� �� ����
		�� �� �� �� �� �� �� λ �� �� �� �� �� 4 �� �ϣ� �� �� �� �� �� �� �� �� �� %d%% �� �� �� �� �� %d��
		�� �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):
		format(damDesc(self, DamageType.LIGHTNING, damage) / 3, damDesc(self, DamageType.LIGHTNING, damage), self:getTalentRadius(t), t.getSearing(self, t), t.getSearing(self, t))
	end,}

registerTalentTranslation{
	id = "T_NEGATIVE_BIOFEEDBACK",
	name = "������",
	info = function(self, t)
		return ([[ÿ �� �� ʹ �� �� �� �� �� �� �� �� �� ʱ�� �� �� �� �� �� �� ʩ �� һ �� �� �� ���� �� �� �� �� %d �� �� �� �� 5 �� �ϡ�
		ÿ �� �� �� �� �� �� �� %d �� �� �� �� �� �� %d �� �� �� �� �� �ס�
		�� �� Ч �� ÿ �� �� ֻ �� �� �� һ �Ρ�]]):
		format(t.getNb(self, t), t.getSave(self, t), t.getPower(self, t))
	end,}
