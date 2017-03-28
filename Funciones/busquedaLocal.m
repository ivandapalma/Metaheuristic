function [mejorSolucion coste] = busquedaLocal(mDistancias, mFlujo,tam)
	solInicial = zeros(1,tam);
    coste=0;
	
	for d=1:tam %Rellena con 1,2,3...tam
		solInicial(d)=d;
	end
	solInicial = solInicial(randperm(numel(solInicial))); % Ordena aleatoriamente el vector
	mejorSolucion = solInicial;
	mejorVecino = solInicial;
    repetir = true;
	while( repetir == true )
	
		% generamos mejor vecino a partir del mejor 
		% que hemos encontrado hasta ahora
		mejorDelVecindario = generaMejorVecino(mejorVecino,mDistancias,mFlujo,tam);

		if(getCoste(mejorDelVecindario,mDistancias,mFlujo,tam) < getCoste(mejorVecino,mDistancias,mFlujo,tam))
			mejorVecino = mejorDelVecindario;
            repetir=true;
        else
            repetir=false;
        end
    end
    
     mejorSolucion = mejorVecino;
     coste = getCoste(mejorSolucion,mDistancias,mFlujo,tam);
        
end
