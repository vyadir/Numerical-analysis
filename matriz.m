function[M]=  matrices(k)
    n = k^2;
    M = zeros(n);
    
    % ------------ Llenar la diagonal principal con 198 -------------%
    for i = 1:n
        for j = 1:n
            if i==j
                M(i,j) = 198;
            end
        end
    end
    %----------------------------------------------------------------%
    
    % Llenar la diagonal de arriba con -100 en grupos de k elementos %
    for i = 1:n
        for j = i:i+1
            if i<j
                if mod(i,k)~=0 
                    M(i,j) = -100;
                end
            end
        end
    end
    %-----------------------------------------------------------------%
    
    %--Llenar la diagonal de abajo con -100 en grupos de k elementos--%
    for i = 1:n
        for j = i:i+1
            if i<j
                if mod(i,k)~=0 
                    M(j,i) = -100;
                end
            end
        end
    end
    %------------------------------------------------------------------%

    
    
    
    %Diagonal de 1 por encima de la diagonal a partir de la columna k+1%
    for j = k+1:n
        for i = j-k:k:n
            if i<j
                    M(i,j) = 1; 
                    M(j,i) = 1;
            end
        end
    end
    %------------------------------------------------------------------%  
end
