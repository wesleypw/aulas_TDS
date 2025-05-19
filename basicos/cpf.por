programa
{
	// biblioteca "x" as "y"
	inclua biblioteca Texto --> t
	inclua biblioteca Tipos --> ty
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
					// contagem para verificar o "cadeia cpf"
					para(inteiro i = 0; i < tam; i++){
						// verifica se está lidando com os números verificadores do cpf "y"
						se(i == 9 ou i == 10) {
							cpf_y += t.obter_caracter(cpf, i)
						// verifica se está lidando com o resto do cpf "x"
						} senao se(i < 9 e i >= 0) {
							cpf_x += t.obter_caracter(cpf, i)
						}
					}
				// imprime as informações que foram separadas em duas variáveis
				escreva("\nCPF: " + cpf_x)
				escreva("\nVerificadores: " + cpf_y)
				} senao {
					caracter letra
					// verifica se o formato inclui "." e "-"
					se(tam == 14){
						// contagem para verificar o "cadeia cpf"
						para(inteiro i = 0; i < tam; i++){
							letra = t.obter_caracter(cpf, i)
							// se o caracter da cadeia não for um número, será desconsiderado para o resto do código
							se(ty.caracter_e_inteiro(letra)){
								cpf_fmt += letra
								se(t.numero_caracteres(cpf_fmt) == 11){
									// contagem para verificar o "cadeia cpf_fmt (cpf formatado)"
									para(inteiro j = 0; j < 11; j++){
										// verifica se está lidando com os números verificadores do cpf "y"
										se(j == 9 ou j == 10) {
											cpf_y += t.obter_caracter(cpf_fmt, j)
										// verifica se está lidando com o resto do cpf "x"
										} senao se(j < 9 e j >= 0) {
											cpf_x += t.obter_caracter(cpf_fmt, j)
										}
									}
								}
							}
						}
					// imprime as informações que foram separadas em duas variáveis
					escreva("\nCPF: " + cpf_x)
					escreva("\nVerificadores: " + cpf_y)
					}
				}
			// se nenhum formato for obedecido, repita o laço
			} senao {
				escreva("\n\tFormato incompatível.")
				escreva("\n\tEscreva apenas em números ou no formato 'xxx.xxx.xxx-xx'")
			}
		} enquanto(tam != 11 e tam != 14)
	}
}
