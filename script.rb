def ler_texto(texto)
  resultado = []

  texto.each_char do |char|
    if (65..122).include?(char.ord)
      if char.ord < 97
        resultado << char.ord - 65
      else
        resultado << char.ord - 97
      end
    else
      return false
    end
  end

  resultado
end

def processar_chave(chave_numerica, entrada_numerica)
  chave_numerica_final = []

  if chave_numerica.length <= entrada_numerica.length
    entrada_numerica.length.times do |i|
      chave_numerica_final << chave_numerica[i % chave_numerica.length]
    end
  else
    puts "Erro! Informe uma chave menor ou uma entrada maior."
  end

  chave_numerica_final
end

def vigenere(funcao)
  print "Informe a chave: "
  chave = gets.chomp
  print "Informe a entrada: "
  entrada = gets.chomp

  chave_numerica = ler_texto(chave)
  unless chave_numerica
    puts "Erro ao ler chave! Informe apenas letras de A-Z."
    return
  end

  entrada_numerica = ler_texto(entrada)
  unless entrada_numerica
    puts "Erro ao ler entrada! Informe apenas letras de A-Z."
    return
  end

  chave_numerica_final = processar_chave(chave_numerica, entrada_numerica)

  resultado = ''
  resultado_numerico = []

  entrada_numerica.length.times do |i|
    if funcao == "E"
      resultado_numerico << (entrada_numerica[i] + chave_numerica_final[i]) % 26
    else
      result = (entrada_numerica[i] - chave_numerica_final[i]) % 26
      result += 26 if result < 0
      resultado_numerico << result
    end
    resultado << (resultado_numerico[i] + 65).chr
  end

  puts "Resultado: #{resultado}"
end

# Exemplo de uso:
vigenere("E")

# Para rodar o codigo use no terminal: "ruby scritp.rb"