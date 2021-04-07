function[Tabla, aprox] = AproxTaylor(f, c,tol ,val) 
% Tabla, es una tabla que contiene lo solicitado en el enunciado, [aprox,grado,error]
% para que se vea mas elegante y ordenado
syms x;
h = val - c;
aprox = 0;
i = 1;
ant_taylor = 0; %error
error_relativo=1;
n=0;
while error_relativo>= tol
    %serie_taylor
    derivada = diff(f,n,x);
    derivada = inline(derivada);
    aprox = (derivada(c) / factorial(n)) * h^n + aprox;
    %tabla
    orden_Derivada(i,1) = i;
    aproxTaylor(i,1) = aprox;
    n=n+1;
    %error
    error_relativo(i,1) = abs((aprox - ant_taylor)/aprox ) * 100;
    ant_taylor = aprox;
    i = i+1;    
end
Tabla = table(orden_Derivada, aproxTaylor, error_relativo);