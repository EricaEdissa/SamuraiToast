require('Coisa')

Mundo = Coisa:new()
function Mundo:new(mundo)
	objeto = Coisa:new{
		posicaoX = 0, posicaoY = 0, 
		altura = mundo.altura, largura = mundo.largura, 
		imagem = mundo.imagem
	}
	objeto.coisas = {}
	self.__index = self
	return setmetatable(objeto, self)
end

function Mundo:adiciona(coisa)
	self.coisas[coisa] = coisa
end

function Mundo:remove(coisa)
	self.coisas[coisa] = nil
end

-- se desenha o mundo desenha as coisas nele
function Mundo:desenha()
	Coisa.desenha(self)
	for _,coisa in pairs(self.coisas) do
		coisa:desenha()
	end
end

-- se move o mundo move o que tem nele
function Mundo:desloca(quantidadeX, quantidadeY)
	Coisa.desloca(self, quantidadeX, quantidadeY)
	for _,coisa in pairs(self.coisas) do
		coisa:desloca(quantidadeX, quantidadeY)
	end
end
