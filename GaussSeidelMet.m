function [msol] = GaussSeidelMet(A,b,x0,m,tol,p)
n=length(x0);
errorVector = []; % aqui se guarda  el error en la norma-p indicada por cada iteración
auxAproxVector = []; %aqui se guardan las aproximaciones en arreglo 1d
iterVector = []; % arreglo donde se guarda el numero de iteración
    
for k=1:m
    w=x0;
    for i=1:n
        s=A(i,1:i-1)*x0(1:i-1)+A(i,i+1:n)*x0(i+1:n);
        x0(i)=(b(i)-s)/A(i,i);
        auxAproxVector = [auxAproxVector, x0(i)];
    end
    
    errorP = norm(x0-w,p); % error en norma p 
    errorVector =[errorVector,errorP]; % almacenamos cada error
    
    if norm(errorP,inf)<tol
        return
    end 
    iterVector = [iterVector, k]; % almacenamos los numeros de iteraciones

% se crea matriz de aproximaciones cuyo numero de filas es el mayor de
% iteraciones y columnas 3.
% esta funcion de reshape es como splitear un vector en subvectores
aproxVector = transpose(reshape(auxAproxVector,[3,length(iterVector)]));

% asignamos a msol lo solicitado por el enunciado
msol = [iterVector' aproxVector errorVector'];
end