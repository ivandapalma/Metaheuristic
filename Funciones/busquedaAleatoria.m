function [mejorSolucion coste] = busquedaAleatoria(mDistancias, mFlujo,tam)
	solInicial = zeros(1,tam);
    coste=0;
	for i=1:tam %Rellena con 1,2,3 hasta tamaño C
		solInicial(i)=i;
	end
	solucionActual = solInicial(randperm(numel(solInicial))); % Ordena aleatoriamente el vector
	mejorSolucion = solucionActual;
	
	for i=1:(1600*tam)
		solucionActual = solInicial(randperm(numel(solInicial))); % Ordena aleatoriamente el vector
		if(getCoste(solucionActual,mDistancias,mFlujo,tam) < getCoste(mejorSolucion,mDistancias,mFlujo,tam))
				mejorSolucion = solucionActual;
        end	
    end
    coste = getCoste(mejorSolucion,mDistancias,mFlujo,tam);
end