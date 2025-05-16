programa{
    funcao inicio(){

    	 
        inteiro cpf1, cpf2, cpf3, cpf4
        cadeia cpf
        cadeia digito1
        cadeia digito2 


        escreva("digite os 3 primeiros digitos(> 0): ")
        leia(cpf1)
        enquanto(cpf1 <=0){
        	escreva("Valor inválido. Digite novamente: ")
         leia(cpf1)
        	}
         
        escreva("digite mais 3 digitos(> 0):  ")
        leia(cpf2)
        enquanto(cpf2 <=0){
        	escreva("Valor inválido. Digite novamente: ")
         leia(cpf2)
        	}
         
        escreva("digite mais 3 digitos(> 0): ")
        leia(cpf3)
        enquanto(cpf3 <=0){
        	escreva("Valor inválido. Digite novamente: ")
         leia(cpf3)
        	}
         
        escreva("digite os ultimos dois digitos(>0): ")
        leia(cpf4)
        enquanto(cpf4 <=0){
        	escreva("Valor inválido. Digite novamente: ")
         leia(cpf4)
        	}
        
        cpf = cpf1 + "." +cpf2+ "." + cpf3+ "-" + cpf4
        escreva("CPF: ", cpf)
        digito1 =  cpf1 + "." +cpf2+ "." + cpf3
        escreva("\nprimeiro digito"+ digito1)
        digito2 = ":"+ cpf4
        escreva("\nsegundo digito" + digito2)
        
                

		
        
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1125; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */