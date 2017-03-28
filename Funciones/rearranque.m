function nuevaPob = rearranque(mejores,nMejores,tamPoblacion,tam)
    
	nuevaPob = zeros(tamPoblacion,tam);
	for i=1:nMejores
		nuevaPob(i,:) = mejores(i,:);
	end

	k=nMejores+1;

	for i=k:tamPoblacion
		nuevaPob(i,:) = randperm(tam);
	end
     
end

