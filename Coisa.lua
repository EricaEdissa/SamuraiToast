-- tabela que representa qualquer coisa no jogo (funciona como classe)
-- valores padroes podem ser colocados aqui
Coisa = {
	posicaoX = 0, posicaoY = 0,
	largura, altura,
	imagem
}

-- funcao new guardada na tabela Coisa
-- equivalente a Coisa.new = function () {...}
function Coisa:new(objeto)    
	-- toda funcao com : ao inves de . tem um parametro self passado escondido
	-- esse parametro self é o nome da tabela antes do : , neste caso
	-- self é Coisa
	
	-- se não for passado objeto então cria um vazio
	objeto = objeto or {}

	-- quando uma variável é chamada e ainda não foi declarada procura-se o valor em __index
	-- agora o quando a tablela não tiver __index o __index é Coisa, ou seja, o que não tiver procura em Coisa
	self.__index = self

	-- a tabela instancia tem os metodos de Coisa de agora em diante
	return setmetatable(objeto, self)
end

function Coisa:vaiParaPosicao(posicaoX, posicaoY)
	self.posicaoX = posicaoX
	self.posicaoY = posicaoY
end

function Coisa:desloca(quantidadeX, quantidadeY)
	self.posicaoX = self.posicaoX + quantidadeX
	self.posicaoY = self.posicaoY + quantidadeY
end

function Coisa:moveParaCima(quantidade)
	self:desloca(0, -quantidade)
end

function Coisa:moveParaBaixo(quantidade)
	self:desloca(0, quantidade)
end

function Coisa:moveParaDireita(quantidade)
	self:desloca(quantidade, 0)
end

function Coisa:moveParaEsquerda(quantidade)
	self:desloca(-quantidade, 0)
end

function Coisa:desenha()
	-- muda pincel para branco
	love.graphics.setColor(255,255,255);
	-- pinta imagem usando love2d
	love.graphics.draw(self.imagem, self.posicaoX, self.posicaoY)
end

--[[
--
--	      (x,y)    	         (x+largura,y)
--		+-----------------------+
--		|                       |
--		|                       |
--		|     Tudo tem corpo    |
--		|        de caixa       |
--		|                       |
--		|                       |
--		|                       |
--		+-----------------------+
--	  (x,y + altura)     (x + largura, y + altura)
--]]

--[[
-- Essa função diz se duas caixas colidiram
-- caixaA e caixaB são arrays com posição (x,y) largura e altura da caixa
-- retorna true se a caixaA colidiu com a caixaB e false caso não.
-]]
function Coisa:colidiu(outraCoisa)
	-- se o objeto nao tem dimensoes ele nao tem corpo
	if self.largura == 0 or self.altura == 0 then
		return false;	
	end

	-- caixa A é a coisa atual
	caixaA.x = self.posicaoX
	caixaA.y = self.posicaoY
	caixaA.altura = self.altura
	caixaA.largura = self.largura

	-- caixa B é a outra coisa
	caixaB.x = outraCoisa.posicaoX
	caixaB.y = outraCoisa.posicaoY
	caixaB.altura = outraCoisa.altura
	caixaB.largura = outraCoisa.largura

	-- premissa: se está do lado não colidiu
	-- de modo analogo, se sobrepõe colidiu

	-- caixa B acima da caixa A
	if caixaB.y + caixaB.altura > caixaA.y
	-- caixa B abaixo da caixa A
	or caixaB.y < caixaA.y + caixaA.altura 
	-- caixa B a esquerda da caixa A
	or caixaB.x + caixaB.largura < caixaA.x 
	-- caixa B a direita da caixa A
	or caixaB.x > caixaA.x + caixaA.largura then
		return false
	end

	-- se não está ao lado então colidiu
	return true;
end
