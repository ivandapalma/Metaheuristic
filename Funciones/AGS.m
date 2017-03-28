function [solucion coste] = AGS(mDistancias, mFlujo,tam)
    
    % Genera poblacion inicial
    tamPoblacion=50;
    poblacion = zeros(tamPoblacion,tam);
    for d=1:tamPoblacion
       poblacion(d,:) = randperm(tam);
    end
    
    % Ordenamos por coste menor y seleccionamos los primeros élites
    poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
    elites = zeros(5,tam);
    for i=1:5
        elites(i,:) = poblacion(i,:);
    end
    
    
    for i=1:200 % cambiar a 200 o 300 (tarda más)
        
        %fprintf('Elite: %d\n',getCoste(elites(1,:),mDistancias,mFlujo,tam));
           
        % Genero un vector con las posiciones nuevas a ordenar
        % y ordena la poblacion con esas posiciones para que despues
        % los cruces sean aleatorios
        poblacion = ordenarAleatorioPorFilas(poblacion,tamPoblacion);
        
        % Cruzamos la poblacion entera por parejas (25 parejas)
        % y cada uno genera 2 hijos
        hijos = zeros(tamPoblacion,tam);
        for j=1:2:(tamPoblacion-1) % Tambien vale poner solo tamPoblacion
            % Cruze Orden OX
            [hijo1 hijo2] = cruceOrdenOX(poblacion(j,:),poblacion(j+1,:),tam);
            
            % Muta al 5-20% (si el rand generado es mejor que 0.15)
             if(rand() < 0.2)
                hijo1 = mutar(hijo1);
                hijo2 = mutar(hijo2);
             end
             
             hijos(j,:)=hijo1;
             hijos(j+1,:)=hijo2;            
        end
        
        % Cambiamos los élites por los peores hijos
        % para ellos ordenamos de peor coste a mejor y cambiamos
        % los 5 primeros hijos por los élites
        hijos = ordSeleccionMayor(mDistancias,mFlujo,hijos,tamPoblacion,tam);
        for j=1:5
            hijos(j,:) = elites(j,:);
        end
        
        % los hijos y los elites son la nueva Poblacion
        for j=1:tamPoblacion
            poblacion(j,:) = hijos(j,:);
        end
       
        poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
        for j=1:5
           elites(j,:) = poblacion(j,:);
        end
        
    end
    
    % El mejor de todos será el élite de la última poblacion generada
    poblacion = ordSeleccion(mDistancias,mFlujo,poblacion,tamPoblacion,tam);
    solucion = poblacion(1,:);
    coste = getCoste(poblacion(1,:),mDistancias,mFlujo,tam);
end

