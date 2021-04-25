close all;

tamFonte=20;
tempo=dados.time;
refPosX=ref.signals.values(:,1);
refVelX=ref.signals.values(:,2);
ThetaX=dados.signals.values(:,1);
ThetaXP=dados.signals.values(:,2);
PosX=dados.signals.values(:,3);
VelX=dados.signals.values(:,4);
acelAng=outControle.signals.values(:,1);



figure

subplot(3,1,1)
plot(tempo,PosX,tempo,refPosX, 'LineWidth',1.5);
title('Posi��o do ballbot','FontWeight','bold','fontsize',20);
ylabel('Dist�ncia [m]');
xlabel('Tempo [s]');
legend('Posi��o','Refer�ncia');
legend('boxoff')
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')



subplot(3,1,2)
plot(tempo,acelAng*180/pi, 'r','LineWidth',1.5);
title('Atuador','FontWeight','bold','fontsize',20);
ylabel('Acelera��o angular (graus/s^2)');
xlabel('Tempo (s)');
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')


subplot(3,1,3)
plot(tempo,ThetaX*180/pi, 'LineWidth',1.5);
title('Arfagem do corpo','FontWeight','bold','fontsize',20);
ylabel('�ngulo [graus]');
xlabel('Tempo (s)');
grid;
ax = gca;
ax.FontSize = tamFonte;
set(gcf,'color','white')




figure
plot(tempo,VelX, 'LineWidth',1.5);
%plot(tempo,VelX, tempo, refVelX, 'LineWidth',1.5);
title('Velocidade do ballbot','FontWeight','bold','fontsize',20);
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




%figure(gcf);
