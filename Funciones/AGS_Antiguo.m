function [solucion coste] = AGS(mDistancias, mFlujo,tam)

    elitesInicial = zeros(5,tam);
    elites = zeros(5,tam);
    coste=0;

    %Los élites iniciales son aleatorios
    for d=1:5
        elitesInicial(d,:) = randperm(tam);
    end	

    % Devuelve los 5 mejores (élites) y la poblacion entera
    [elites poblacion] = generarPoblacion(mDistancias, mFlujo,elitesInicial,tam);
    
    % Coge el mejor entre los élites
    MejorDeTodos = elites(1,:);
    costeMejorDeTodos = getCoste(elites(1,:),mDistancias,mFlujo,tam);

    for i=1:100 %poner 1000 o 2000
        % Genera nueva poblacion incluyendo a los élites
        
        %fprintf('\nMejor: %s   Coste: %d',num2str(MejorDeTodos),costeMejorDeTodos);
        [elites poblacion] = generarPoblacion(mDistancias, mFlujo,elites,tam);   
        
        % Genera 5 números al azar y escoge el mejor y el tercer mejor
        [primerMejor tercerMejor] = seleccionTorneo(mDistancias, mFlujo,poblacion,tam);
        
        % Cruze Orden OX
        [cruce1 cruce2] = cruceOrdenOX(primerMejor,tercerMejor,tam);
        
        % Muta al 14% (si el rand generado es mejor que 0.15)
        if(rand() < 0.15)
            cruce1 = mutar(cruce1);
            cruce2 = mutar(cruce2);
        end

        % Evaluacion. Comparación con el mejor anterior
        costeCruce1 = getCoste(cruce1,mDistancias,mFlujo,tam);
        costeCruce2 = getCoste(cruce2,mDistancias,mFlujo,tam);

        if( costeCruce1 < costeMejorDeTodos)
            MejorDeTodos = cruce1;
            costeMejorDeTodos = costeCruce1;
        end

        if( costeCruce2 < costeMejorDeTodos)
            MejorDeTodos = cruce2;
            costeMejorDeTodos = costeCruce2;
        end

    end    
    %fprintf('\nMejor: %s\tCoste: %d',num2str(MejorDeTodos),costeMejorDeTodos);
       
    solucion = MejorDeTodos;
    coste = costeMejorDeTodos;
end

