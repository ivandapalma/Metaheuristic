function pob = ordSeleccion(mDistancias, mFlujo,pob,filas,columnas)

    for i=1:(filas-1)
        min=i;
        for j=i+1:filas
            if(getCoste(pob(min,:),mDistancias,mFlujo,columnas) > getCoste(pob(j,:),mDistancias,mFlujo,columnas))
                min=j;
            end
        end
        aux = pob(min,:);
        pob(min,:) = pob(i,:);
        pob(i,:) = aux;            
    end
    
end

