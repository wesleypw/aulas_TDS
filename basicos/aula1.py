#verifique se o vetor forma um palíndromo
vetor = input("Digite os elementos do vetor separados por espaço: ")

def palindromo(vetor):
   
    if vetor == vetor[::-1]:
        print("O vetor é um palíndromo")
    else:
        print("O vetor não é um palíndromo")

palindromo(vetor)


