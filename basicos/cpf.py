def valida_cpf(cpf: str) -> bool: #valor booleano
    # Remove todos os caracteres que não são números
    cpf = ''.join(filter(str.isdigit, cpf)) #o join vai remover todos os espaço, 
                                            #o filter vai remover todos os caracteres que não são números 
                                            #e o str isdigit é uma função que retorna True se o caractere for um dígito.
    
    # Verifica se o tamanho é 11 (sem formatação)
    if len(cpf) != 11:
        return False
        
    # Verifica se todos os dígitos são iguais (ex: 11111111111)
    if cpf == cpf[0] * 11:
        return False
        
    # Calcula o primeiro dígito verificador do CPF
    soma = sum(int(cpf[i]) * (10 - i) for i in range(9))
    digito1 = (soma * 10 % 11) % 10
    
    # Calcula o segundo dígito verificador do CPF
    soma = sum(int(cpf[i]) * (11 - i) for i in range(10))
    digito2 = (soma * 10 % 11) % 10
    
    # Verifica se os dígitos calculados conferem com os informados
    return cpf[-2:] == f"{digito1}{digito2}"


if __name__ == "__main__":
    print("Validador de CPF")
    print("-" * 30)
    
    while True:
        # Solicita o CPF ao usuário
        cpf = input("\nDigite um CPF (apenas números ou no formato 000.000.000-00): ")
        
        # Valida o CPF
        if valida_cpf(cpf):
            print(f" CPF {cpf} é válido!")
        else:
            print(f" CPF {cpf} é inválido!")
        
        # Pergunta se deseja continuar
        continuar = input("\nDeseja validar outro CPF? (s/n): ").strip().lower()
        if continuar != 's':
            print("\nPrograma encerrado.")
            break
