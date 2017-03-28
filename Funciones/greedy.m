function solucion = greedy(mDistancias, mFlujo,tam)

	% Cálculo de los potenciales de flujo y distancias
	pFlujo = sum(mFlujo');
    pDistancias = sum(mDistancias);
	solucion = zeros(1,tam);
    
    % El algoritmo irá seleccionando la unidad i libre con mayor fi y le
    % asignará la localización k libre con menor dk .
     
    for i=1:tam
        iMF = find(pFlujo==max(pFlujo)); %indice máximo flujo
        iMD = find(pDistancias==min(pDistancias)); %indice mínina distancia
        solucion(iMF(1)) = iMD(1);
        pDistancias(iMD) = max(pDistancias)+1; %Minimo pasa a ser el máximo
        pFlujo(iMF) = 0;
        % para que no lo tenga en cuenta
    end
        % Las de mayor flujo en los índices con menor distancia
end
