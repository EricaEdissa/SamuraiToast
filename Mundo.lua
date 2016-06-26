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

-- adiciona uma coisa no mapa que por padrao se move com ele
-- se solta for true a coisa nao se desloca junto do mapa
function Mundo:adiciona(coisa, solta)
	coisa._solta = solta -- adiciona um campo _solta a coisa passada
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
		if not coisa._solta then
			coisa:desloca(quantidadeX, quantidadeY)
		end
	end
end

function Mundo:detectaColisao(coisa)
	local colisoes = {}
	local numeroDeColisoes = 0;
	for _,outraCoisa in pairs(self.coisas) do
		if coisa ~= outraCoisa and coisa:colidiu(outraCoisa) then
			colisoes[numeroDeColisoes] = outraCoisa
			numeroDeColisoes = numeroDeColisoes + 1
		end
	end

	return colisoes
end
