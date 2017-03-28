function solucion = greedy(mDistancias, mFlujo,tam)

	% C�lculo de los potenciales de flujo y distancias
	pFlujo = sum(mFlujo');
    pDistancias = sum(mDistancias);
	solucion = zeros(1,tam);
    
    % El algoritmo ir� seleccionando la unidad i libre con mayor fi y le
    % asignar� la localizaci�n k libre con menor dk .
     
    for i=1:tam
        iMF = find(pFlujo==max(pFlujo)); %indice m�ximo flujo
        iMD = find(pDistancias==min(pDistancias)); %indice m�nina distancia
        solucion(iMF(1)) = iMD(1);
        pDistancias(iMD) = max(pDistancias)+1; %Minimo pasa a ser el m�ximo
        pFlujo(iMF) = 0;
        % para que no lo tenga en cuenta
    end
        % Las de mayor flujo en los �ndices con menor distancia
end
