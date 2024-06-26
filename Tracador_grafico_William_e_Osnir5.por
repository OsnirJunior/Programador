programa
{
	inclua biblioteca Mouse-->mou
	inclua biblioteca Teclado-->t
	inclua biblioteca Util-->u
	inclua biblioteca Graficos-->g
	inclua biblioteca Matematica-->m

	inteiro CINZA=g.criar_cor(211,211,211),x_mouse=0,y_mouse=0
	inteiro CINZA2=g.criar_cor(128,128,128),a=0,b=0,c=0,b2=b,c2=c
	inteiro cont=5,cont2=-5
	real vetor_x[5000],vetor_y[5000]
	logico avermelhar1=falso,avermelhar2=falso,avermelhar3=falso,avermelhar4=falso,avermelhar5=falso,avermelhar6=falso,avermelhar7=falso,avermelhar8=falso
	real x1=0.00,x2=0.00,xv=0.00,yv=0.00,delta=0.00,y=335.00,zoom=-50.0,x=0.0,xc = 750, yc=350

	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1024,650)
		g.definir_titulo_janela("TRAÇADORGRÁFICODEFUNÇÕES")
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			teclado()
			pontos_xy()
			grafico()
			mouse()
			equacoes()
		}
	}
	funcao teclado(){
		u.aguarde(100)
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=160 e y_mouse>=120 e x_mouse>=40 e x_mouse<=80){
			avermelhar1=verdadeiro
			avermelhar2=falso
			avermelhar3=falso
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=160 e y_mouse>=120 e x_mouse>=158 e x_mouse<=198){
			avermelhar1=falso
			avermelhar2=verdadeiro
			avermelhar3=falso
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=160 e y_mouse>=120 e x_mouse>=272 e x_mouse<=312){
			avermelhar1=falso
			avermelhar2=falso
			avermelhar3=verdadeiro
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=87 e y_mouse>=47 e x_mouse>=600 e x_mouse<=640){
			avermelhar6=verdadeiro
			avermelhar7=falso
			avermelhar8=falso
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=87 e y_mouse>=47 e x_mouse>=650 e x_mouse<=690){
			avermelhar6=falso
			avermelhar7=verdadeiro
			avermelhar8=falso
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=87 e y_mouse>=47 e x_mouse>=700 e x_mouse<=740){
			avermelhar6=falso
			avermelhar7=falso
			avermelhar8=verdadeiro
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=87 e y_mouse>=47 e x_mouse>=900 e x_mouse<=940){
			avermelhar4=verdadeiro
			avermelhar5=falso
			zoom+=-3
		}
		se(mou.botao_pressionado(mou.BOTAO_ESQUERDO) e y_mouse<=87 e y_mouse>=47 e x_mouse>=950 e x_mouse<=990 e zoom!=-2){
			avermelhar4=falso
			avermelhar5=verdadeiro
			zoom+=+3
			
		}
		se(t.tecla_pressionada(t.TECLA_ADICAO) e avermelhar1==verdadeiro){
			a+=1
		}
		
		se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e avermelhar1==verdadeiro){
			a-=1
		}
		
		se(t.tecla_pressionada(t.TECLA_ADICAO) e avermelhar2==verdadeiro){
			b+=1
		}
		se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e avermelhar2==verdadeiro){
			b-=1
		}
		se(t.tecla_pressionada(t.TECLA_ADICAO) e avermelhar3==verdadeiro){
			c+=1
		}
		se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e avermelhar3==verdadeiro){
			c-=1
		}
	}
	funcao coeficientes(){
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(28.00)
		g.desenhar_texto(52,127,a+"")
		g.desenhar_texto(170,127,b2+"")
		g.desenhar_texto(284,127,c2+"")
	}
	funcao grafico(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		//definirretanguloeixo
		para(inteiro i=100;i<=600;i+=25){
			g.definir_cor(CINZA)
			g.desenhar_linha(500,i,1000,i)
		}
		para(inteiro i=500;i<=1000;i+=25){
			g.definir_cor(CINZA)
			g.desenhar_linha(i,100,i,600)
		}
		para(inteiro i=100;i<=600;i+=50){
			g.definir_cor(CINZA2)
			g.desenhar_linha(500,i,1000,i)
		}
		para(inteiro i=500;i<=1000;i+=50){
			g.definir_cor(CINZA2)
			g.desenhar_linha(i,100,i,600)
		}
		para(inteiro i=500;i<=1000;i+=5){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_linha(i,347,i,352)
		}
		para(inteiro i=500;i<=1000;i+=50){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_linha(i,335,i,366)
		}
		para(inteiro i=100;i<=600;i+=5.0){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_linha(747,i,752,i)
		}
		para(inteiro i=100;i<=600;i+=50){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_linha(734,i,765,i)
		}
		parabola()
		g.definir_cor(g.COR_BRANCO)

		pontos_xy()
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(0, 0, 500, 600, falso, verdadeiro)
		g.desenhar_retangulo(0, 0, 1000, 100, falso, verdadeiro)
		g.desenhar_retangulo(0, 600, 1000, 650, falso, verdadeiro)
		g.desenhar_retangulo(1000, 0, 1024, 650, falso, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		
		g.desenhar_retangulo(20,10,980,80,falso,falso)
		g.desenhar_retangulo(20,100,450,500,falso,falso)
		g.desenhar_retangulo(500,100,500,500,falso,falso)
		g.definir_cor(g.COR_AZUL)
		quadrados()
		coeficientes()
		eixo()	
		g.definir_tamanho_texto(30.0)	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_linha(40,225,60,225)
		g.desenhar_linha(60,225,50,200)
		g.desenhar_linha(40,225,50,200)
		g.desenhar_texto(75,200,"=")
		g.definir_tamanho_texto(20.00)
		g.desenhar_texto(110,205,"b²-4.a.c")
		g.desenhar_retangulo(200,195,70,35,falso,falso)
		g.desenhar_texto(220,205,""+delta)
		g.desenhar_texto(40,425,"X1=")
		g.desenhar_retangulo(95,416,70,35,falso,falso)
		g.desenhar_texto(115,425,m.arredondar(x1,1)+"")
		g.desenhar_texto(40,475,"X2=")
		g.desenhar_retangulo(95,465,70,35,falso,falso)
		g.desenhar_texto(115,475,m.arredondar(x2,1)+"")
		g.desenhar_texto(40,275,"Xv=")
		g.desenhar_texto(92,268,"-b")
		g.desenhar_texto(92,288,"2a")
		g.desenhar_linha(88,285,115,285)
		g.desenhar_retangulo(130,268,70,35,falso,falso)
		g.desenhar_texto(150,278,m.arredondar(xv,1)+"")
		g.desenhar_texto(40,350,"Yv=")
		g.desenhar_texto(92,343,"-")
		g.desenhar_linha(100,356,110,356)
		g.desenhar_linha(110,356,105,345)
		g.desenhar_linha(105,345,100,356)
		g.desenhar_linha(88,360,115,360)
		g.desenhar_texto(92,365,"4a")
		g.desenhar_texto(149,355,m.arredondar(yv,1)+"")
		g.desenhar_retangulo(130,344,70,35,falso,falso)
		
		g.renderizar()
	}
	funcao quadrados(){
		b2=b
		c2=c
		se(b2<0){
			b2=b2-b-b
		}
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(40,120,40,40,falso,falso)
		se(avermelhar1==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(40,120,40,40,falso,falso)
			}
		se(b>=0){
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(34.00)
			g.desenhar_texto(90,125,"X²+")
		}
		senao se(b<0){
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(34.00)
			g.desenhar_texto(90,125,"X²-")
		}
		g.desenhar_retangulo(158,120,40,40,falso,falso)
		se(avermelhar2==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(158,120,40,40,falso,falso)
		}
		se(c>=0){
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(209,125,"X+")
		}
		senao se(c<0){
			c2=c2-c-c
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(209,125,"X-")
		}
		g.desenhar_retangulo(272,120,40,40,falso,falso)
		se(avermelhar3==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(272,120,40,40,falso,falso)
		}

		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(322,125,"=f(x)")
		g.desenhar_retangulo(900,47,40,40,falso,falso)
		g.definir_tamanho_texto(30.00)
		g.desenhar_texto(910,53,"+")
		se(avermelhar4==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_texto(910,53,"+")
			g.desenhar_retangulo(900,47,40,40,falso,falso)
			avermelhar4=falso
		}
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(950,47,40,40,falso,falso)
		g.definir_tamanho_texto(40.00)
		g.desenhar_texto(963,50,"-")
		se(avermelhar5==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_texto(963,50,"-")
			g.desenhar_retangulo(950,47,40,40,falso,falso)
			avermelhar5=falso
		}
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600,47,40,40,falso,falso)
		g.desenhar_elipse(618, 65, 4, 4, verdadeiro)
		se(avermelhar6==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_elipse(618, 65, 4, 4, verdadeiro)
			g.desenhar_retangulo(600,47,40,40,falso,falso)
		}
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(650,47,40,40,falso,falso)
		g.desenhar_elipse(667, 63, 8, 8, verdadeiro)
		se(avermelhar7==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_elipse(667, 63, 8, 8, verdadeiro)
			g.desenhar_retangulo(650,47,40,40,falso,falso)
		}
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(700,47,40,40,falso,falso)
		g.desenhar_linha(700, 87, 740, 47)
		se(avermelhar8==verdadeiro){
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_linha(700, 87, 740, 47)
			g.desenhar_retangulo(700,47,40,40,falso,falso)
		}
	}
	funcao eixo(){
		g.definir_cor(g.COR_VERMELHO)
		//definireixox
		g.desenhar_linha(500,350,1000,350)
		//definireixoy
		g.desenhar_linha(750,100,750,600)
	}
	funcao parabola(){
		se(delta>0){	
			g.definir_tamanho_texto(10.0)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse((-x1*zoom)+750,335,15,15,verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto((-x1*zoom)+752,337,""+x1)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse((-x2*zoom)+750,335,15,15,verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto((-x2*zoom)+752,337,""+x2)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse((-xv*zoom)+750,(yv*zoom)+335,15,15,verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto((-xv*zoom)+755,(yv*zoom)+337,xv+","+yv)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_elipse(750,(c*zoom)+335,15,15,verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto(755,(c*zoom)+337,""+c)
			g.definir_cor(g.COR_PRETO)
		}
		
	}
	funcao mouse(){
		x_mouse=mou.posicao_x()
		y_mouse=mou.posicao_y()
		se(0==0){

		}
		
	}
	funcao equacoes(){
		xv=2*a
		xv=-(b)/xv
		delta=m.potencia(b,2)-(4*a*c)
		yv=4*a
		yv=-delta/yv
		x1=(-(b)+m.raiz(delta,2))/(2*a)
		x2=(-(b)-m.raiz(delta,2))/(2*a)
	}
	funcao pontos_xy(){
		x=-50.00
		para(inteiro i=0;i<4999;i++){
			x+=0.02
			vetor_x[i]=x
			vetor_y[i]=(a*m.potencia(vetor_x[i], 2)+b*vetor_x[i]+c)*zoom

			se(avermelhar6 == verdadeiro){
				g.definir_cor(g.COR_PRETO)
				g.desenhar_ponto(vetor_x[i]*-zoom+xc, vetor_y[i]+yc)
			}
				
			se(avermelhar7 == verdadeiro){
				g.definir_cor(g.COR_PRETO)
				g.desenhar_elipse(vetor_x[i]*-zoom+xc, vetor_y[i]+yc, 2, 2, falso)
			}
			se(avermelhar8 == verdadeiro){
				g.definir_cor(g.COR_PRETO)
				g.desenhar_linha(vetor_x[i]*-zoom+xc, vetor_y[i]+yc, vetor_x[i+1]*-zoom+xc, vetor_y[i+1]+yc)
			}
			
		}
	}
	//Versão final de um traçador gráfico de funções, Feito Por William Colasso e Osnir Portinari, na aprendizagem industrial de programador de sistema
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9677; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor_x, 12, 6, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor;
 */