programa{
    funcao inicio(){

    	
        inteiro cpf1, cpf2, cpf3, cpf4
        cadeia cpf


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
        

		
        
    }
}
