clc
clear

load data_ML_SGPI_iter40.mat

Y1=squeeze(mean(Convergence_tot));

load data_SGPI_dv.mat

Y2=squeeze(mean(Convergence_tot));

load data_SGPI_Ger.mat

Y3=squeeze(mean(Convergence_tot));
load data_SGPI_fixed.mat

Y4=squeeze(mean(Convergence_tot));


figure;
for i = 4
    % subplot(2,3,i); % Create a 2x3 grid of subplots
    plot(Y1(:,i), '-', 'Color',color(1),'LineWidth', 1.5); % Plot Y1 in blue
    hold on;
    plot(Y2(:,i), '--', 'Color',color(2),'LineWidth', 1.5); % Plot Y2 in red dashed line
    hold on;
    plot(Y3(:,i),'-.','Color',color(3),'LineWidth', 1.5);

    plot(Y4(:,i),'-','Color',color(4),'Linewidth',1.5)

    xlabel('Iteration Index');
    ylabel(['Objective Value']);
    
    legend('SGPI-Deep', 'SGPI-Eig','SGPI-Gersh', 'SGPI-Fixed','Location','southeast');
    grid on;
end
    
