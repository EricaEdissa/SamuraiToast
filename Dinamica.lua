Dinamica = {atualiza, duracao, tempoEmExecucao}

function Dinamica:new(duracao, atualizacao)
	objeto = {}
	objeto.tempoEmExecucao = 0
	objeto.duracao = duracao
	objeto.atualiza = atualizacao or function () end
	objeto.pausado = false
	self.__index = self
	return setmetatable(objeto, self)
end

function Dinamica:executa(dt)
	if not self.pausado then
		if self.duracao and self.tempoEmExecucao > self.duracao then
			self:pausa()
			return
		end
		self.atualiza(dt) -- definido pelo usuario	
		self.tempoEmExecucao = self.tempoEmExecucao + dt
	end
end

function Dinamica:pausa()
	self.pausado = true
end

function Dinamica:para()
	self:pausa()
	self.tempoEmExecucao = 0
end

function Dinamica:despausa()
	self.pausado = false
end

