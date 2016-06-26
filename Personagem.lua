require "Coisa"

-- O personagem é uma coisa, então tem que ter todas funções de Coisa
Personagem = Coisa:new()
Personagem.vida = 0
Personagem.dano = 0
Personagem.velocidade = 0

function Personagem:new(personagem)
	-- atributos comuns a coisa
	objeto = Coisa:new{
		posicaoX = personagem.posicaoX,
		posicaoY = personagem.posicaoY,
		altura = personagem.altura,
		largura = personagem.largura,
		imagem = personagem.imagem
	}

	-- atributos específicos do personagem
	objeto.vida = personagem.vida
	objeto.dano = personagem.dano
	objeto.velocidade  = personagem.velocidade

	self.__index = self
	return setmetatable(objeto, self)
end

function Personagem:baterEm(outroPersonagem)
	outroPersonagem.vida = outroPersonagem.vida - self.dano	
end

function Personagem:curar(vida)
	if vida > 0 then
		self.vida = self.vida + vida
	end	
end

function Personagem:andarParaCima(dt)
	self:moveParaCima(self.velocidade * dt)
end

function Personagem:andaParaBaixo(dt)
	self:moveParaBaixo(self.velocidade * dt)
end

function Personagem:andaParaDireita(dt)
	self:moveParaDireita(self.velocidade * dt)
end

function Personagem:andaParaEsquerda(dt)
	self:moveParaEsquerda(self.velocidade * dt)
end
