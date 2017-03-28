function [nuevosElites nuevaPob] = generarPoblacion(mDistancias, mFlujo,elites,tam)

    nuevaPob = zeros(tam,tam);
    % Introducimos los elites en la poblacion
    for i=1:5
        nuevaPob(i,:)=elites(i,:);
    end
   
    for i=6:tam
        nuevaPob(i,:) = randperm(tam);
    end
    
    % Ordenamos según coste
    nuevaPob = ordSeleccion(mDistancias, mFlujo,nuevaPob,tam,tam);
    
    % Visualizacion de la ordenacion. Es correcta
    %  for i=1:tam
    %      fprintf('%s %d\n',num2str(nuevaPob(i,:)),getCoste(nuevaPob(i,:),mDistancias,mFlujo,tam))
    %  end
    
    % Cogemos los 5 mejores como élites
    for j=1:5
        nuevosElites(j,:) = nuevaPob(j,:);
    end
    
end

