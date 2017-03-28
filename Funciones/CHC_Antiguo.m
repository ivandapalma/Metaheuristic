function [solucion coste] = CHC(mDistancias, mFlujo,tam)
 
 % tam=25;
 d = floor(tam/4); % floor coge solo la parte entera
 M = 5; % Numero de mejores
 
 % Poblacion inicial aleatoria
 tamPoblacion = 50;
 poblacion = zeros(tamPoblacion,tam);
 for d=1:tamPoblacion
    poblacion(d,:) = randperm(tam);
 end	

 % Ordenamos la poblacion de menor a mayor coste y cogemos los M primeros
 poblacion = ordSeleccion(mDistancias,mFlujo,tam);
 mejores = zeros(M,tam);
 for i=1:M
    mejores(i,:) = poblacion(i,:);
 end
 
 MejorDeTodos = poblacion(i,:);
 costeMejorDeTodos = getCoste(MejorDeTodos,mDistancias,mFlujo,tam);
 
 for i=1:100 % Cambiar a 1000
 
    % Cruce con prevencion de incesto. Cruza los 6 mejores
    % comprobando sus distancias Hamming para evitar incesto
    [hijos nHijos] = cruceHUXsinIncesto(mejores,tam);
    
    % Evaluamos los hijos obtenidos, si es que se han obtenido
    if(nHijos > 0)
        % Comparacion de los hijos con el Mejor de Todos
        for j=1:nHijos
            costeHijo = getCoste(hijos(j,:),mDistancias,mFlujo,tam);
            if ( costeHijo < costeMejorDeTodos)
                MejorDeTodos = hijos(j,:);
                costeMejorDeTodos = costeHijo;                
            end
        end    
    
        % Reemplaza peores de la poblacion anterior con los hijos
        % si es que se han creado
        % Ordenamos de mayor a menor coste, quitamos los nHijos primeros
        % que serán los peores por los hijos creados y volvemos a ordenar
        % la poblacion de menor a mayor
        poblacion = ordSeleccionMayor(mDistancias,mFlujo,poblacion,tam,tam);
        for x=1:nHijos
            poblacion(x,:) = hijos(x,:);
        end
        poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tam,tam);
    
    % Si no se han creado hijos
    else
        d = d - 1;
    end
    
    if (d < 0)
        poblacion = rearranque(mejores,tam);
        r = rand();
        d = r*(1.0 - r)*tam;
    end
    
 end
    solucion = MejorDeTodos;
    coste = costeMejorDeTodos;
    
end

