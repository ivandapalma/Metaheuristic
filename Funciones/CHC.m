function [solucion coste] = CHC(mDistancias, mFlujo,tam)
 
 d = floor(tam/4); % floor coge solo la parte entera
 nMejores = 6; % Numero de mejores
 
 % Poblacion inicial aleatoria
 tamPoblacion = 50;
 poblacion = zeros(tamPoblacion,tam);
 for d=1:tamPoblacion
    poblacion(d,:) = randperm(tam);
 end	

 % Ordenamos la poblacion de menor a mayor coste
 % y cogemos los mejores
 mejores = zeros(nMejores,tam);
 poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
 for i=1:nMejores
    mejores(i,:) = poblacion(i,:);
 end

 
 for i=1:500
    fprintf('\nMejores. Generacion %d\n',i);
    for m=1:nMejores
        fprintf('%d\n',getCoste(mejores(m,:),mDistancias,mFlujo,tam));
    end
    
    % Cruce con prevencion de incesto. Cruza los 6 mejores
    % comprobando sus distancias Hamming para evitar incesto
    [hijos nHijos] = cruceHUX(mejores,nMejores,d,tam);
    
    % Evaluamos los hijos obtenidos, si es que se han obtenido
    if(nHijos > 0)
        % Reemplaza peores de la poblacion anterior con los hijos
        % si es que se han creado
        % Ordenamos de mayor a menor coste, quitamos los nHijos primeros
        % que serán los peores por los hijos creados y volvemos a ordenar
        % la poblacion de menor a mayor
        poblacion = ordSeleccionMayor(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
        for x=1:nHijos
            poblacion(x,:) = hijos(x,:);
        end
        %poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
    
    % Si no se han creado hijos
    else
        d = d - 1;
    end
    
    if (d < 0)
        poblacion = rearranque(mejores,nMejores,tamPoblacion,tam);
        r = rand();
        d = floor(r*(1.0 - r)*tam);
    end
    
    % Obtencion de los nuevos mejores
    poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
    for q=1:nMejores
        mejores(q,:) = poblacion(q,:);
    end
    
 end
 
    poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
    solucion = poblacion(1,:);
    coste = getCoste(poblacion(1,:),mDistancias,mFlujo,tam);

end

