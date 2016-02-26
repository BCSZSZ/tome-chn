local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_LUNAR_ORB",
	name = "�¹�֮��",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		local restore = t.getNegative(self, t)
		return ([[�� Ŀ �� �� �� �� �� һ �� �� �� �� ��. ֱ �� �� �� ǽ �� �� �� �� �� ͼ �� Ե, �� �� �� �� �� %0.2f �� �� Ӱ �� �� �� �� �� %d �� �� ��. �� �� �� �� �� �� �� �� Ϊ %d, ÿ �� �� һ �� �� �� �� �� �� �� 25%% �� �� �� ��, �� �� �� �� �� �� �� ע �� �� ��.]]):
		format(damDesc(self, DamageType.DARKNESS, damage), restore, restore * 4)
	end,}

registerTalentTranslation{
	id = "T_ASTRAL_PATH",
	name = "�ǹ���",
	info = function(self, t)
		return ([[�� %d �� �� �� �� һ �� �� �� �� ��.
		�� �� �� �� �� �� �� Ŀ �� �� ʱ, �� �� �� �� �� �� �� λ ��.
		�� �� �� �� �� (%d%%) �� �� �� �� �� �� �� �� �� �� ��.]]):format(t.range(self, t), t.proj_speed(self, t)*100)
	end,}

registerTalentTranslation{
	id = "T_GALACTIC_PULSE",
	name = "��������",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[�� 8 �� �� �� �� һ �� �� �� �� �� �� �� �� �� �� �� ��.
		�� �� �� �� ʱ, �� �� �� �� �� Ŀ �� �� �� ��, �� �� %0.2f �� Ӱ �� �� �� ÿ �� �� һ �� �� �� 1 �� �� �� ��.]]):
		format(damDesc(self, DamageType.DARKNESS, damage))
	end,}

registerTalentTranslation{
	id = "T_SUPERNOVA",
	name = "������",
	info = function(self, t)
		local damage = t.getDamage(self, t)
		local radius = self:getTalentRadius(t)
		local pin = t.getPinDuration(self, t)
		return ([[�� �� �� �� �� �� �� �� �� �� %d �� �� Χ �� �� �� (�� Χ %d) �� �� �� ģ �� �� �� �� ��.
		�� �� %0.2f �� �� Ӱ �� �� �� �� �� �� �� �� �� �� �� %d �غ�.
		�� �� �� �� �� �� �� �� �� �� ǿ �� �� ��, �� ���� �� Χ���� �� �� �� �� ʱ �� ȫ �� �� �� �� �� �� �� �� �� �� �� �� ��.]]):
		format(radius, self:getTalentRange(t), damDesc(self, DamageType.DARKNESS, damage), pin)
	end,}
return _M