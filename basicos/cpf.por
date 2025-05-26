programa
{
	// biblioteca "x" as "y"
	inclua biblioteca Texto --> t
	inclua biblioteca Tipos --> ty

	funcao msg_erro(){
		escreva("\n\tFormato incompatível.")
		escreva("\n\tEscreva apenas em números ou no formato 'xxx.xxx.xxx-xx'")
	}
	
	funcao inicio()
	{
		// o cpf lido em cadeia permite que não haja erros como um cpf não ser lido por começar com "0"
		cadeia cpf, cpf_x = "", cpf_y = "", cpf_fmt = ""
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
					// se tudo digitado for inteiro, está correto
					se(ty.cadeia_e_inteiro(cpf, 10)){
						escreva("O cpf é compatível com o formato\nFormato - 'somente números'\nCPF - ", cpf)
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
						// se o que sobrou foi inteiro, está correto
						se(ty.cadeia_e_inteiro(cpf_fmt, 10)){
							escreva("O cpf é compatível com o formato\nFormato - 'xxx.xxx.xxx-xx'\nCPF - ", cpf_fmt)
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
			}
		} enquanto(tam != 11 e tam != 14)
	}
}
