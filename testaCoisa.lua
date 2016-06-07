Coisa = require('Coisa')


-- Testa Coisa
--
-- É importante criar testes para a classe que você criou

coisinha = Coisa:new(20,30,10,15,'imagemDaCoisinha.png')

print(coisinha)
print(coisinha.posicaoX)
print(coisinha.posicaoY)
print(coisinha.largura)
print(coisinha.altura)
print(coisinha.imagem)

print('---------------------------------')

coisaA = Coisa:new(0,1,2,3,'coisaA.png')
coisaB = Coisa:new(3,2,1,3,'coisaB.png')

print(coisaA.imagem)
print(coisaA)
print(getmetatable(coisaA))

print('------------------')

print(coisaB.imagem)
print(coisaB)
print(getmetatable(coisaB))


print('------------------')

print(Coisa)
