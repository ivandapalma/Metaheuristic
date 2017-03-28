function coste = getCoste(sol, mDistancias, mFlujo,N)
	coste = 0;
	for i=1:N
		for j=1:N
			if i~=j % No contempla la diagonal
				coste = coste + mFlujo(i,j)*mDistancias(sol(i),sol(j));
            end
        end
	end
end