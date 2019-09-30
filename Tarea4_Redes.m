clear all; clc;
pTransmision= [0.005,	0.01,	0.05,	0.07,	0.1];
tasaA=zeros(1,5);
tasaB=zeros(1,5);

for i=1:length(pTransmision)
    stationA = 0;
    stationB = 0;
    numTransmisionesA = 0;
    numTransmisionesB = 0;
    transmisionesExitosasA=0;
    transmisionesExistosasB=0;
    x=0;
    y=0;
    numColisiones = 0;

    while numColisiones <= 50 %Minimo # de colisiones

        x=rand; %probabilidad de que transmita A
        if(x <= pTransmision(i)) %Si es menor, se manda
            stationA = 1; %se transmite A
            numTransmisionesA = numTransmisionesA + 1;
        else 
            stationA = 0; %no se transmite A
        end


        y=rand; %probabilidad de que transmita B
         if(y <= pTransmision(i)) %Si es menor, se manda
            stationB = 1; %se transmite B
            numTransmisionesB = numTransmisionesB + 1;
         else 
            stationB = 0; %no se transmite B
         end

         %Revisar si hay colisiones
         if(stationA == 1 && stationB == 1)
            numColisiones = numColisiones + 1;
         end 
    end

    transmisionesExitosasA=numTransmisionesA-numColisiones;
    transmisionesExitosasB=numTransmisionesB-numColisiones;
    
    tasaA(i)=transmisionesExitosasA/numTransmisionesA;
    tasaB(i)=transmisionesExitosasB/numTransmisionesB;
end

figure (1)
%interpolacion sobre los valores obtenidos
plot(pTransmision, tasaA);
hold on;
%valores obtenidos
plot(pTransmision, tasaA,'*');
title('Tasa de transmisiones exitosas en A');
xlabel('Probabilidad de que A transmita una trama');  
ylabel('Tasa de éxito'); 

figure (2)
%interpolacion sobre los valores obtenidos
plot(pTransmision, tasaB);
hold on;
%valores obtenidos
plot(pTransmision, tasaB,'*');
title('Tasa de transmisiones exitosas en B');
xlabel('Probabilidad de que B transmita una trama');
ylabel('Tasa de éxito');