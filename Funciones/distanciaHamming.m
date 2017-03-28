function dHamming = distanciaHamming(vector1, vector2, tam)
	
	dHamming=0;
	
	for i=1:tam
		if(vector1(i)~=vector2(i))
			dHamming = dHamming + 1;
		end
	end

end