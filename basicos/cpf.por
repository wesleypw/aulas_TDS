programa
{
	// biblioteca "x" as "y"
	inclua biblioteca Texto --> t
	inclua biblioteca Tipos --> ty

	// evita poluir o código com muita informação, sendo chamada posteriormente
	funcao msg_erro(){
		escreva("\n\tFormato incompatível.")
		escreva("\n\tEscreva apenas em números ou no formato 'xxx.xxx.xxx-xx'")
	}
	
	// função separar_cpf_x(   tam,      cpf,      cpf_x   )
	funcao cadeia sep_cpf_x(inteiro t, cadeia c, cadeia cx){
		para(inteiro i = 0; i < t; i++){
			// verifica se está lidando com o resto do cpf "x"
			se(i < 9 e i >= 0) {
				cx += t.obter_caracter(c, i)
			}
		}
		retorne cx
	}

	// função separar_cpf_y(   tam,      cpf,      cpf_x   )
	funcao cadeia sep_cpf_y(inteiro t, cadeia c, cadeia cy){
		para(inteiro i = 0; i < t; i++){
			// verifica se está lidando com os números verificadores do cpf "y"
			se(i == 9 ou i == 10) {
				cy += t.obter_caracter(c, i)
			}
		}
		retorne cy
	}

	// função que calcula o dígito verificador
				      //cpf_x     multiplicador     contador
	funcao cadeia dv_calc(cadeia c, inteiro mult, inteiro cont){
		// mult = 10 no dv1 | mult = 11 no dv2
		inteiro cpf_atual
		inteiro soma = 0
		inteiro resto
		cadeia resultado

		// cont = 8 no dv1 | cont = 9 no dv2
		para(inteiro i = 0; i < cont; i++){
			cpf_atual = ty.caracter_para_inteiro(t.obter_caracter(c, i))
			soma += (cpf_atual * mult)
			mult -= 1
		}
		// após a soma, verifica o resto da divisão
		resto = soma % 11
		se(resto < 2){
			resultado = ty.inteiro_para_cadeia(0, 10)
		} senao {
			resultado = ty.inteiro_para_cadeia((11 - resto), 10)
		}
		retorne resultado
	}

	// função que verifica se o digitado confere com o número encontrado no cálculo
	           // calculado    digitado    (DV1 ou DV2?)
	funcao logico testify(cadeia d, caracter dt, inteiro id){
		// verificando o PDV ou SDV com o digitado
		se(d == ty.caracter_para_cadeia(dt)){
			escreva("\nDígito Verificador ", id, " é Válido!")
			retorne verdadeiro
		} senao {
			escreva("\nDígito Verificador ", id, " não é Válido!")
			retorne falso
		}
	}
	
	funcao inicio()
	{
		// o cpf lido em cadeia permite que não haja erros como um cpf não ser lido por começar com "0"
		cadeia cpf, cpf_x = "", cpf_y = "", cpf_fmt = "", dv1, dv2
		caracter dgt1
		inteiro tam

		// "faça enquanto" para repetir a requisição das informações dentro do laço
		faca{
			// permite a entrada de dados e a conversão deles
			escreva("\nEscreva seu cpf\n\t>> ")
			leia(cpf)
			tam = t.numero_caracteres(cpf)
			se(tam == 11 ou tam == 14){
				// verifica se o formato é "somente números"
				se(tam == 11){
					// se tudo digitado for inteiro, separa em duas variáveis para comparação com cálculo do DV
					se(ty.cadeia_e_inteiro(cpf, 10)){
						// separa em duas variáveis para comparação futura
						cpf_x = sep_cpf_x(tam, cpf, cpf_x)
						cpf_y = sep_cpf_y(tam, cpf, cpf_y)
						// cpf_y separado em dois dígitos
						dgt1 = t.obter_caracter(cpf_y, 0)
						// exibe o CPF e os dígitos verificadores digitados
						escreva("\nCPF: ", cpf)
						escreva("\nDV1 digitado: ", dgt1)
						// realiza o cálculo dos dígitos verificadores
						dv1 = dv_calc(cpf_x, 10, 9)
						escreva("\nDV1 calculado: ", dv1)
						// vericicando se os dígitos verificadores são compatíveis com os digitados
						testify(dv1, dgt1, 1)
					// se algo digitado não for inteiro, incorreto
					} senao {
						msg_erro()
					}
				}
				// verifica se o formato inclui "." e "-"
				se(tam == 14){
					// contagem para verificar o "cadeia cpf"
					para(inteiro i = 0; i < tam; i++){
						// variável para preparar o próximo laço de repetição
						caracter digito
						digito = t.obter_caracter(cpf, i)
						// se o caracter da cadeia não for um número, será desconsiderado para o resto do código
						se(ty.caracter_e_inteiro(digito)){
							cpf_fmt += digito
						}
					}
					// depois de converter, retirando o que não for inteiro, verifica "somente números"
					se(t.numero_caracteres(cpf_fmt) == 11){
						// se o que sobrou foi inteiro, separa em duas variáveis para comparação com cálculo do DV
						se(ty.cadeia_e_inteiro(cpf_fmt, 10)){
							// separa em duas variáveis para comparação futura
							cpf_x = sep_cpf_x(tam, cpf_fmt, cpf_x)
							cpf_y = sep_cpf_y(tam, cpf_fmt, cpf_y)
							// cpf_y separado em dois dígitos
							dgt1 = t.obter_caracter(cpf_y, 0)
							// exibe o CPF e os dígitos verificadores digitados
							escreva("\nCPF: ", cpf_fmt)
							escreva("\nDV1 digitado: ", dgt1)
							// realiza o cálculo dos dígitos verificadores
							dv1 = dv_calc(cpf_x, 10, 9)
							escreva("\nDV1 calculado: ", dv1)
							// vericicando se os dígitos verificadores são compatíveis com os digitados
							testify(dv1, dgt1, 1)
						// se algo não foi inteiro, incorreto
						} senao {
							msg_erro()
						}
					} senao {
						msg_erro()
					}
				}
			} senao {
				msg_erro()
				pare
			}
		} enquanto(tam != 11 e tam != 14)
	}
}
