mD = csvread('mDistancias.csv'); % lector CSV
mF = csvread('mFlujo.csv'); % lector CSV
tam = 6;
solInicial = zeros(1,tam);

for d=1:tam %Rellena con 1,2,3...tam
	solInicial(d)=d;
end

solInicial = solInicial(randperm(numel(solInicial))); % Ordena aleatoriamente el vector
fprintf('\nInicial:\t%s\n\n',num2str(solInicial));

mejor=generaMejorVecino(solInicial,mD,mF,tam);
c=getCoste(mejor,mD,mF,tam);
fprintf('\nMejor:\t\t%s\tCoste:\t%d\n',num2str(mejor),c);
