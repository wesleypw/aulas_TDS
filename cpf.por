programa {
  funcao inicio() {
    inteiro cpf[1], digitos[1]

    para(inteiro i = 0; i < 1; i++) {
        escreva("Digite o CPF sem os dígitos (maior que 0): ")
        leia(cpf[i])

        enquanto(cpf[i] <= 0) {
            escreva("Valor inválido! Digite um número maior que 0: ")
            leia(cpf[i])
        }
    }

    escreva("Digite os 2 dígitos verificadores do CPF: ")
    para(inteiro i = 0; i < 1; i++) {
        leia(digitos[i])
        enquanto(digitos[i] <= 0) {
            escreva("Valor inválido! Digite um número maior que 0: ")
            leia(digitos[i])
        }
    }

    escreva("CPF: ", cpf, "\n", "     ",digitos)
  }
}
