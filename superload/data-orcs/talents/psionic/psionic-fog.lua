local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_VAPOROUS_STEP",
	name = "������",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[�� �� �� �� �� �� �� һ Щ �� �� �� �� �� �� �� �� �� �� �� �� �� Զ �� �� 
		ÿ �� �� �� �� �� �� �� �� �� �� �� �� �� �� %d �� ��
		�� �� �� �� ״ ̬ ʱ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ˲ �� �� �� �� �� �� �� �� �� �� һ �� �� �� 4 �� �� �� �� �� �� �� �� ը ��
		�� ը �� �� �� %0.2f �� �� ÿ �� 33%% �� �� �� �� �� �� �� �� �� ʪ ״ ̬��
		�� �� Ŀ �� �� �� �� �� �� ռ �� �� �� �� �� �� ֮ �� �� �� �� �� �� ʧ �� ��
		�� �� �� �� �� �� �� �� �� ֵ �� �ӡ�]]):
		format(t.getMaxCharge(self, t), damDesc(self, DamageType.FIRE, damage))
	end,}

registerTalentTranslation{
	id = "T_INHALE_VAPOURS",
	name = "��������",
	info = function(self, t)
		return ([[�� �� �� �� �� �� �� ʱ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� һ Щ �� �� �� �� �� %d �� �� �� %d �� �� ��
		Ч �� �� �� �� �� �� �� �� �� �� �� �� 33%% ��
		�� �� �� �� �� �� �� �� �� �� ǿ �� �� �� ��]]):
		format(t.getSteam(self, t), t.getHeal(self, t))
	end,}

registerTalentTranslation{
	id = "T_PSIONIC_FOG",
	name = "��������",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		local duration = t.getDuration(self, t)
		return ([[�� �� �� �� �� �� �� �� �� �� �� �� Ϊ �� �� %d �� �� �� �� �� �� �� ��
		�� �� �� �� �� �� �� �� �� ÿ �� �� �� �� �� �� %0.2f �� �� �� �� �� �� �� �� ���� �� �� �� %d%% �� �� �� �� �� %d �� �� �� �� ��
		�� �� �� �� �� �� �� �� �� ǿ �� �� �ӡ�]]):
		format(duration, damDesc(self, DamageType.MIND, damage), t.getSearing(self, t), t.getSearing(self, t))
	end,}

registerTalentTranslation{
	id = "T_UNCERTAINTY_PRINCIPLE",
	name = "�ⲻ׼ԭ��",
	info = function(self, t)
		return ([[�� �� �� �� �� �� �� �� ʹ �� �� �� �� �� ǿ �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ̬ �� �� ��
		�� �� �� �� �� �� ʱ �� �� �� �� �� �� һ �� �� �� �� λ �á�
		�� �� Ч �� �� �� ȴ ʱ �� ��]]):
		format()
	end,}
