clear all
close all
clc
path(path,'Funciones');

M = csvread('tai25b.csv'); % lector CSV
[F C] = size(M);
mDistancias = M(1:C,1:C);
mFlujo = M((C+1):(2*C),1:C);
tam=C;



% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
% ALGORITMO GENETICO CHC

solucionesCHC = zeros(3,tam);
costesCHC = zeros(1,3);
for i=1:3
    [solucionCHC costeCHC] = CHC(mDistancias,mFlujo,tam);
    solucionesCHC(i,:)=solucionCHC;
    costesCHC(i)=costeCHC;
end
mediaCostesCHC = mean(costesCHC); %Media de los costes
dtCostesCHC = std(costesCHC);

fprintf('\n\n\t\t\t  ALGORITMO GENETICO CHC');
for i=1:3
    fprintf('\n\nEjecucion %d\n%s\n%d',i,num2str(solucionesCHC(i,:)),costesCHC(i));
end
fprintf('\n\nMedia\t\t\t%d\n',mediaCostesCHC);
fprintf('Desv. Tipica  \t%d\n',dtCostesCHC);



% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
% ALGORITMO GENETICO SIMPLE

solucionesAGS = zeros(3,tam);
costesAGS = zeros(1,3);
for i=1:3
    [solucionAGS costeAGS] = AGS(mDistancias,mFlujo,tam);
    solucionesAGS(i,:)=solucionAGS;
    costesAGS(i)=costeAGS;
end
mediaCostesAGS = mean(costesAGS); %Media de los costes
dtCostesAGS = std(costesAGS);

fprintf('\n\n\t\t\t  ALGORITMO GENETICO SIMPLE');
for i=1:3
    fprintf('\n\nEjecucion %d\n%s\n%d',i,num2str(solucionesAGS(i,:)),costesAGS(i));
end
fprintf('\n\nMedia\t\t\t%d\n',mediaCostesAGS);
fprintf('Desv. Tipica  \t%d\n',dtCostesAGS);



% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

% BUSQUEDA GREEDY
solucionGreedy = greedy(mDistancias,mFlujo,tam);
costeGreedy = getCoste(solucionGreedy,mDistancias,mFlujo,tam);   
fprintf('Solucion: %s\n',num2str(solucionGreedy));
fprintf('\nCoste Greedy:  \t%d\n',costeGreedy);


% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

% BUSQUEDA ALEATORIA
solucionesBA = zeros(5,tam);
costesBA = zeros(1,5);
for i=1:5
	[mejorSolucion c] = busquedaAleatoria (mDistancias,mFlujo,tam);
	solucionesBA(i,:) = mejorSolucion;
	costesBA(i)=c;
end

mediaCostesBA = mean(costesBA); %Media de los costes
dtCostesBA = std(costesBA);

% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

% BUSQUEDA LOCAL
solucionesBL = zeros(5,tam);
costesBL = zeros(1,5);
for i=1:5
	[mejorSolucion c] = busquedaLocal (mDistancias,mFlujo,tam);
	solucionesBL(i,:) = mejorSolucion;
	costesBL(i)=c;
end

mediaCostesBL = mean(costesBL); %Media de los costes
dtCostesBL = std(costesBL);


% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

% ENFRIAMIENTO SIMULADO 
solucionesES = zeros(5,tam);
costesES = zeros(1,5);
for i=1:5
	[solucionES costeES] = enfriamientoSimulado (mDistancias,mFlujo,tam);
	solucionesES(i,:) = solucionES;
	costesES(i)=costeES;
end

mediaCostesES = mean(costesES); %Media de los costes
dtCostesES = std(costesES);

fprintf('\n\t\t\t  ENFRIAMIENTO SIMULADO');
fprintf('\n\t\t\t\t  Costes\n');
for i=1:5
    fprintf('Ejecucion %d  \t%d\n',i,costesES(i));
end
fprintf('Media\t\t\t%d\n',mediaCostesES);
fprintf('Desv. Tipica  \t%d\n',dtCostesES);

% EDITARRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
% MOSTRAR RESULTADOS
fprintf('\n\t\t\t  BUSQ. ALEATORIA\tBUSQ. LOCAL');
fprintf('\n\t\t\t\t  Costes\t\t  Costes\n');
for i=1:5
    fprintf('Ejecucion %d  \t%d\t\t%d\n',i,costesBA(i),costesBL(i));
end
fprintf('Media\t\t\t%d\t%d\n',mediaCostesBA,mediaCostesBL);
fprintf('Desv. Tipica  \t%d\t%d\n',dtCostesBA,dtCostesBL);