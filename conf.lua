function love.conf(t)
	t.window.width = 800
	t.window.height = 600
	t.title = "Samurai Toast"
	t.author = "Geral"
	t.identity = "Samurai Toast"
end

-- configurações de caminhos

imagens = "recursos/"
sons = "recursos/"
texto = "recursos/"
fontes = "recursos/"
modulos = "modulos/"

function adicionaCaminhoAlternativo(nomeDoArquivo, caminhoAlternativo)
end

function aplicaCaminhoAlternativo(nomeDoArquivo, caminhoAlternativo)
	if not love.filesystem.exists(nomeDoArquivo) then -- se o arquivo nao foi encontrado
		-- chame a funcao mudando para o caminho alternativo
		nomeDoArquivo = caminhoAlternativo .. nomeDoArquivo
	end
	return nomeDoArquivo
end

require "love.graphics"
require "love.audio"

local oldNewImage = love.graphics.newImage
function love.graphics.newImage(nomeDoArquivo)
	return oldNewImage(aplicaCaminhoAlternativo(nomeDoArquivo, imagens))
end

local oldNewFont = love.graphics.newFont
function love.graphics.newFont(nomeDoArquivo, sizeOfChar)
	return oldNewFont(aplicaCaminhoAlternativo(nomeDoArquivo, fontes), sizeOfChar)
end

local oldSetNewFont = love.graphics.setNewFont
function love.graphics.setNewFont(nomeDoArquivo, sizeOfChar)
	return oldSetNewFont(aplicaCaminhoAlternativo(nomeDoArquivo, fontes), sizeOfChar)
end

local oldNewSource = love.audio.newSource
function love.audio.newSource(nomeDoArquivo, mode)
	return oldNewSource(aplicaCaminhoAlternativo(nomeDoArquivo, sons), mode)
end


local tempFun = io.open
function io.open(nomeDoArquivo)
	return tempFun(aplicaCaminhoAlternativo(nomeDoArquivo, texto))
end

--adiciona a pasta de modulos ao pacote
-- pega todos os modulos na pasta de modulos
local pastasDosModulos = love.filesystem.getDirectoryItems(modulos)
for _,pastaDoModulo in ipairs(pastasDosModulos) do
	-- adiciona caminho nos pacotes do projeto
	package.path = package.path .. ";" .. modulos .. pastaDoModulo
end

print "configuracao!"
