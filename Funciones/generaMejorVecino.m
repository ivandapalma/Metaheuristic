function mejorVecino = generaMejorVecino(vector,mDistancias,mFlujo,tam)

   mejorVecino = vector;
   mejorDelVecindario = vector;
   nVecino = 0;
    for i=1:tam-1
        for j=i+1:tam
            nVecino = nVecino+1;
            nuevoVecino = intercambiar(vector,i,j); %Intercambia siempre del inicial
            c = getCoste(nuevoVecino,mDistancias,mFlujo,tam);
            %fprintf('Vecino %i:\t%s\tCoste:\t%d\n',nVecino,num2str(nuevoVecino),c);
            if( c < getCoste(mejorDelVecindario,mDistancias,mFlujo,tam) ) %Compara con el mejor del vecindario
					mejorDelVecindario = nuevoVecino;
            end
        end
    end
    mejorVecino = mejorDelVecindario;
end