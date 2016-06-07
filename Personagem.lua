Coisa = require('Coisa')

-- O personagem é uma coisa, então tem que ter todas funções de Coisa
Personagem = Coisa:new()

function Personagem:new(posicaoX, posicaoY, altura, largura, imagem, vida, dano)
	-- atributos comuns a coisa
	atributos.posicaoX = posicaoX
	atributos.posicaoY = posicaoY
	atributos.altura = altura
	atributos.largura = largura
	atributos.imagem = imagem

	-- atributos específicos do personagem
	atributos.vida = vida
	atributos.dano = dano

	self.__index = self
	return setmetatable(atributos, self)
end

return Personagem

function Personagem:baterEm(outroPersonagem)
	outroPersonagem.vida = outroPersonagem.vida - self.dano	
end

