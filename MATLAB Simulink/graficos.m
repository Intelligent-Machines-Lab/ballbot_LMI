close all;

tamFonte=14;
tempo=dados.time;
refPosX=ref.signals.values(:,1);
refVelX=ref.signals.values(:,2);
ThetaX=dados.signals.values(:,1);
ThetaXP=dados.signals.values(:,2);
PosX=dados.signals.values(:,3);
VelX=dados.signals.values(:,4);
acelAng=outControle.signals.values(:,1);


subplot(2,2,1); 
%plot(tempo,PosX,'LineWidth',1.5);
plot(tempo,PosX,tempo,refPosX, 'LineWidth',1.5);
title('Posi��o da roda [m]');
ylabel('Posi��o X [m]');
xlabel('Tempo [s]');
legend('Posi��o do rob�','Refer�ncia');
legend('boxoff')
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')



subplot(2,2,2); 
plot(tempo,ThetaX*180/pi, 'LineWidth',1.5);
title('Arfagem do corpo');
ylabel('�ngulo do corpo [graus]');
xlabel('Tempo (s)');
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')




subplot(2,2,3); 
plot(tempo,VelX, 'LineWidth',1.5);
%plot(tempo,VelX, tempo, refVelX, 'LineWidth',1.5);
title('Velocidade linear do corpo');
ylabel('Velocidade [m/s]');
xlabel('Tempo (s)');
%legend('Velocidade do rob�','Refer�ncia');
grid;
%plot(tempo,ThetaXP*180/pi);
%title('Velocidade Angular do corpo');
%ylabel('Velocidade angular [graus/s]');
%xlabel('Tempo (s)');
%grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')




subplot(2,2,4); 
plot(tempo,acelAng, 'LineWidth',1.5);
title('Sa�da do controlador');
ylabel('Acelera��o angular (rad/s^2)');
xlabel('Tempo (s)');
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')

%figure(gcf);
