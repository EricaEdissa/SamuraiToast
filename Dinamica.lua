Dinamica = {atualiza, duracao, tempoEmExecucao}

function Dinamica:new(duracao, atualizacao)
	objeto = {}
	objeto.tempoEmExecucao = 0
	objeto.duracao = duracao
	objeto.atualiza = atualizacao or function () end
	self.__index = self
	return setmetatable(objeto, self)
end

function Dinamica:executa(dt)
	self.tempoEmExecucao = self.tempoEmExecucao + dt
	if self.duracao and self.tempoEmExecucao > self.duracao then return end
	self.atualiza(dt) -- definido pelo usuario	
end

function Dinamica:voltaDoInicio()
	self.tempoEmExecucao = 0
end
