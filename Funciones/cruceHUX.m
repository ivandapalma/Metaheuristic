function [hijos nHijos] = cruceHUX(mejores,nMejores,d,tam)
    
    maxHijos=6;
    hijos = zeros(maxHijos,tam);
    nHijos=0;
    mejo = ordenarAleatorioPorFilas(mejores,nMejores);
    
    for i=1:2:(nMejores-1)
        
        if(distanciaHamming(mejo(i,:),mejo(i+1,:),tam) > d )
            [hijo1 hijo2] = crearHijosCHC(mejo(i,:),mejo(i+1,:),tam);
            hijos(i,:) = hijo1;
            hijos(i+1,:) = hijo2;
            nHijos = nHijos + 2;
        end
    end
    
    % Coge las filas que sean distintas de 0
    hijos = hijos(find(sum(hijos')>0),:);
    
end