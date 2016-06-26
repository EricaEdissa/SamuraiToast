Coisa = require('Coisa')

-- O personagem é uma coisa, então tem que ter todas funções de Coisa
Personagem = Coisa:new()

function Personagem:new(personagem)
	-- atributos comuns a coisa
	objeto = Coisa:new{
		posicaoX = personagem.posicaoX
		posicaoY = personagem.posicaoY
		altura = personagem.altura
		largura = personagem.largura
		imagem = personagem.imagem
	}

	-- atributos específicos do personagem
	objeto.vida = personagem.vida
	objeto.dano = personagem.dano

	self.__index = self
	return setmetatable(atributos, self)
end

return Personagem

function Personagem:baterEm(outroPersonagem)
	outroPersonagem.vida = outroPersonagem.vida - self.dano	
end

