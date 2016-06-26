-- Uma animação é algo que acontece em um determinado tempo, possui um certo número de estados discretos
-- e que ao logo destes intervalos executa repetiamente a atualização do sistema
require("Dinamica")

Animacao = Dinamica:new()
function Animacao:new(quadros, coisa, duracao)
	objeto = Dinamica:new(duracao)

	objeto.quadros = quadros
	objeto.coisa = coisa
	objeto.atualiza = function (dt) objeto:toca(dt) end
	self.__index = self
	return setmetatable(objeto, self)
end

function Animacao:toca(dt)
	numeroDoQuadro = math.floor( (#(self.quadros) / self.duracao) * self.tempoEmExecucao) + 1
	self.coisa.imagem = self.quadros[numeroDoQuadro]
end

function Animacao:rebobina()
	self.tempoEmExecucao = 0;
end
