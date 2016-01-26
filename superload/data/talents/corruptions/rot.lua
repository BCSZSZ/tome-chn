local _M = loadPrevious(...)

registerTalentTranslation{
	id = "T_INFECTIOUS_BITE",
	name = "��Ⱦ�Կ�ҧ",
	info = function(self, t)
		local damage = t.getDamage(self, t) * 100
		local poison = t.getPoisonDamage(self, t)
		return ([[�� ҧ Ŀ �꣬�� �� %d%% �� �� �� ����  
		�� �� �� �� �� �� Ŀ �� �� �� ע �� �� �� �� ��,  �� �� %0.2f �� ή �� �� �� �� 4 �� �� �� �� �� %0.2f �� ή �� ����
		�� �� �� ���� ǿ �� �� �ɡ�]])
		:format(damage, damDesc(self, DamageType.BLIGHT, poison/4), damDesc(self, DamageType.BLIGHT, poison) )
	end,
}

registerTalentTranslation{
	id = "T_INFESTATION",
	name = "����",
	info = function(self, t)
	local resist = t.getResist(self,t)
	local affinity = t.getAffinity(self,t)
	local cap = t.getDamagePct(self,t)
	local damage = t.getDamageReduction(self,t)	
		return ([[�� �� �� �� �� �� �� �� ,�� �� %d%% �� ή �� �� �� �� �� ,%d%% �� ή �� �� �� �գ� �� �� �� �� �� �� �� �� �� �� �� �ơ�
		ÿ �� �� �� ֵ �� ʧ �� �� %d%% ʱ,�� �� �� �� �� %d%% ��ͬ ʱ �� �� �� �� �� �� �� �� �� ��, �� �� �� �� �� �� 10 �غ� ��
		ͬ ʱ Ҳ �� �� �� �� �� �� �� �� %d%% �� ������ �� �� �� �� �� Ⱦ �� �� ҧ�� �� �� %d�� ��
		�� �� �� ȫ �� �� �� �� �� �� ǿ �� ��]]):
		format(resist, affinity, cap*100, damage*100, self:getTalentLevel(t)*5, self:getTalentLevelRaw(t))
	end,
}

registerTalentTranslation{
	id = "T_WORM_WALK",
	name = "�������",
	info = function(self, t)
		local range = self:getTalentRange(t)
		local heal = t.getHeal(self, t) * 100
		local vim = t.getVim(self, t)
		local dam = t.getDam(self,t)
		return ([[�� �� �� �� �� �� �� �� �� �� �� �� �� ��
�� �� �� �� �� �� ʹ �� �� �� �� �� �� �� �� �� �� �� �� �� λ �� �� �� �� %d%% �� �� �� �� ֵ , �� �� %d �� �� ��
�� �� �� �� �� λ �� ʹ �� �� �� �� �� %d%% �� ǰ �� �� �� �� λ �� �� �� һ �� �� �� ��
ͬ ʱ �� �� �� �� �� %d%% �� �� �� �� ή �� �� �� �� �� ��]]):
format (heal, vim, dam, self:getTalentLevel(t)*8)
	end,
}

registerTalentTranslation{
	id = "T_PESTILENT_BLIGHT",
	name = "������ή",
	info = function(self, t)
	local chance = t.getChance(self,t)
	local duration = t.getDuration(self,t)
		return ([[ÿ �� �� �� �� ή �� �� ���� %d%% �� �� �� Ŀ �� �� �� �� �� Ĭ ���� ä �� �� е �� �� �� �� %d �� �ϡ� �� Ч �� �� �� ȴ ʱ �䡣
�� �� �� �� 4 ʱ �� �� Ч �� �� �� �� 1 �� �� �� Ŀ �� �� Ч ��
ͬ ʱ �� �� �� �� �� �� �� ս �� �� �� �� %d%% �� �� �� �� �� Ĭ �� �� ä �� �� е �� �� �� Ч �� �� �� �� 2 �� �� ��
�� �� ״ ̬ ʩ �� �� �� �� �� ǿ �� Ӱ �졣]]):
		format(chance, duration, self:getTalentLevel(t)*4)
	end,
}

registerTalentTranslation{
	id = "T_WORM_ROT",
	name = "�������",
	info = function(self, t)
		local duration = t.getDuration(self, t)
		local damage = t.getDamage(self, t)
		local burst = t.getBurstDamage(self, t)
		return ([[ʹ Ŀ �� �� Ⱦ �� �� �� �� �� �� �� �� %d �� �ϡ� ÿ �� �� �� �� �� Ŀ �� һ �� �� �� �� �� Ч �� �� �� �� %0.2f �� ϵ �� %0.2f �� ή �� ���� 
		 �� �� 5 �� �� �� δ �� �� �� �� �� �� �� �� �� �� �� %0.2f �� ϵ �� ���� �� �� �� �� Ч �� �� �� �� �� Ŀ �� �� �� �� Ϊ һ �� �� �� �� �� �� �档
		 �� �� �� �� �� ǿ �� �� �ɡ�]]):
		format(duration, damDesc(self, DamageType.ACID, (damage/2)), damDesc(self, DamageType.BLIGHT, (damage/2)), damDesc(self, DamageType.ACID, (burst)))
	end,
}


return _M
