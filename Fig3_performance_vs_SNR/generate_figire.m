clc
clear

schnum=4;
poinum=6;
SR_figure=zeros(schnum,poinum);
CRLB_figure=zeros(schnum,poinum);

load data_ML_SGPI_iter40.mat

SR_figure(1,:)=mean(SR_all);
CRLB_figure(1,:)=mean(CRB_all);

Ti(1,:)=mean(Time_all);
load data_SGPI_Eig.mat

SR_figure(2,:)=mean(SR_all);
CRLB_figure(2,:)=mean(CRB_all);
Ti(2,:)=mean(Time_all);
load data_SGPI_Ger.mat

SR_figure(3,:)=mean(SR_all);
CRLB_figure(3,:)=mean(CRB_all);
Ti(3,:)=mean(Time_all);
load data_SGPI_fixed.mat

SR_figure(4,:)=mean(SR_all);
CRLB_figure(4,:)=mean(CRB_all);
Ti(4,:)=mean(Time_all);

K=10:2:20;
SchName={'SGPI-Deep', 'SGPI-Eig','SGPI-Gersh', 'SGPI-Fixed'};
Markername={'+', 'o', 'd', 'v'};
figure;

yyaxis left
for i=1:schnum
    Line_SR(i)=plot(K,SR_figure(i,:),'-','Color',color(i), 'Linewidth',1.5,'DisplayName',[SchName{i} ' SR'],'Marker',Markername{i});
    hold on
    grid on
end
% ylim([0,26])
ylabel('SR (nat/s/Hz)')

yyaxis right
for i=1:schnum
    Line_CRLB(i)=plot(K,CRLB_figure(i,:),'--','Color',color(i+10), 'Linewidth',1.5,'DisplayName',[SchName{i} ' CRLB'],'Marker',Markername{i});
    hold on
    grid on
end
% ylim([0.18, 0.5])
ylabel('CRLB')

xlabel('Transmit Power (dBm)')

lgd1 = legend(Line_SR, 'Location', 'NorthWest');
title(lgd1, 'Sum Rate');
axesNew1=axes('position',get(gca,'position'),'visible','off');
lgd2 = legend(axesNew1,Line_CRLB, 'Location', 'NorthEast');
title(lgd2, 'CRLB');
axesNew=axes('position',get(gca,'position'),'visible','off');



   % 
   % hold on;
   %  plot(y1, '-', 'Color',color(1),'LineWidth', 1.5, 'Marker','+'); % Plot Y1 in blue
   % 
   %  plot(y2, '-', 'Color',color(2),'LineWidth', 1.5, 'Marker','square'); % Plot Y2 in red dashed line
   % 
   %  plot(y3,'-','Color',color(3),'LineWidth', 1.5, 'Marker','diamond');
   % 
   %  plot(y4,'-','Color',color(4),'Linewidth',1.5, 'Marker','v')
   % 
   %  xlabel('Number of Communications Users');
   %  ylabel('Objective Value');
   % 
   %  legend('SGPI-Deep', 'SGPI-Eig','SGPI-Gersh', 'SGPI-Fixed','Location','southeast');
   %  grid on;

   %  figure;
   % 
   % hold on;
   %  plot(t1, '--', 'Color',color(1),'LineWidth', 1.5, 'Marker','+'); % Plot Y1 in blue
   % 
   %  plot(t2, '--', 'Color',color(2),'LineWidth', 1.5, 'Marker','square'); % Plot Y2 in red dashed line
   % 
   %  plot(t3,'--','Color',color(3),'LineWidth', 1.5, 'Marker','diamond');
   % 
   %  plot(t4,'--','Color',color(4),'Linewidth',1.5, 'Marker','v')
   % 
   %  xlabel('Number of Communications Users');
   %  ylabel('Objective Value');
   % 
   %  legend('SGPI-Deep', 'SGPI-Eig','SGPI-Gersh', 'SGPI-Fixed','Location','southeast');
   %  grid on;
   % 
