function puntoFijo(x0, error, iterMax, gx)
% x0 es el punto inicial, error es el error en % por ejemplo 10% entonces
% se manda 10 por parámetro, luego iterMax son las iteraciones máximas y gx es
% la función.
aprox = x0;
iter = 0;
g = inline(gx);
do = 0;
while (do == 0)
    aproxAnterior = aprox;
    aprox = g(aproxAnterior);
    iter = iter + 1;
    if (aprox ~= 0)
        ea = abs((aprox - aproxAnterior)/aprox)*100;
    end
    if ((ea < error) || (iter >= iterMax))
        break;
    end
end
disp('Resultado')
aprox