function M = intercambiar(M,i,j)
	aux = M(i);
	M(i) = M(j);
	M(j) = aux;
end