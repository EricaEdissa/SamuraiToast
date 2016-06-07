Personagem = require('Personagem')

rocha = Personagem:new()
print(Personagem)
print(Coisa)
print(getmetatable(rocha))

guerreiroNascido = Personagem:new(12, 35, 100, 50, 'guerreiro.png', 2000, 150)
print(guerreiroNascido.posicaoX)
print(guerreiroNascido.posicaoY)
print(guerreiroNascido.altura)
print(guerreiroNascido.largura)
print(guerreiroNascido.imagem)
print(guerreiroNascido.vida)
print(guerreiroNascido.dano)

guerreiroCriado = Personagem:new()
guerreiroCriado.posicaoX = 13
guerreiroCriado.posicaoY = 36
guerreiroCriado.altura = 101
guerreiroCriado.largura = 51
guerreiroCriado.imagem = 'guerreiro.png'
guerreiroCriado.vida = 5000
guerreiroCriado.dano = 600
print(guerreiroCriado.posicaoX)
print(guerreiroCriado.posicaoY)
print(guerreiroCriado.altura)
print(guerreiroCriado.largura)
print(guerreiroCriado.imagem)
print(guerreiroCriado.vida)
print(guerreiroCriado.dano)

