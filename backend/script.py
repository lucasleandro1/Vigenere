def ler_texto(texto):
    resultado = []

    for char in texto:
        if 65 <= ord(char) <= 122:
            if ord(char) < 97:
                resultado.append(ord(char) - 65)
            else:
                resultado.append(ord(char) - 97)
        else:
            return False

    return resultado

def processar_chave(chave_numerica, entrada_numerica):
    chave_numerica_final = []

    if len(chave_numerica) <= len(entrada_numerica):
        for i in range(len(entrada_numerica)):
            chave_numerica_final.append(chave_numerica[i % len(chave_numerica)])
    else:
        print("Erro! Informe uma chave menor ou uma entrada maior.")

    return chave_numerica_final

def vigenere(funcao):
    chave = input("Informe a chave: ")
    entrada = input("Informe a entrada: ")

    chave_numerica = ler_texto(chave)
    if not chave_numerica:
        print("Erro ao ler chave! Informe apenas letras de A-Z.")

    entrada_numerica = ler_texto(entrada)
    if not entrada_numerica:
        print("Erro ao ler entrada! Informe apenas letras de A-Z.")

    chave_numerica_final = processar_chave(chave_numerica, entrada_numerica)

    resultado = ''
    resultado_numerico = []

    for i in range(len(entrada_numerica)):
        if funcao == "E":
            resultado_numerico.append((entrada_numerica[i] + chave_numerica_final[i]) % 26)
        else:
            resultado_numerico.append(((entrada_numerica[i] - chave_numerica_final[i]) % 26) + 26 if (entrada_numerica[i] - chave_numerica_final[i]) % 26 < 0 else (entrada_numerica[i] - chave_numerica_final[i]) % 26)
        resultado += chr(resultado_numerico[i] + 65)

    print("Resultado:", resultado)

# Exemplo de uso:
vigenere("E")
