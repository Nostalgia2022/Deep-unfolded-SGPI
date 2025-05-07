
clc
clear

% Load data
data1 = load('data_ML_SGPI_iter40.mat');
data2 = load('data_SGPI_Ger.mat');
data3 = load('data_SGPI_fixed.mat');

% Extract and average SR_all and CRB_all
SR1 = mean(data1.SR_all, 1);  
SR2 = mean(data2.SR_all, 1);
SR3 = mean(data3.SR_all, 1);

CRB1 = mean(data1.CRB_all, 1);
CRB2 = mean(data2.CRB_all, 1);
CRB3 = mean(data3.CRB_all, 1);

% Compute the weighted sum
WS1 = 0.1 * SR1 - CRB1;
WS2 = 0.1 * SR2 - CRB2;
WS3 = 0.1 * SR3 - CRB3;

% X-axis labels (assuming indices from 1 to 6 correspond to methods or parameters)
x_labels = 2:2:12;  

% Create figure
figure; 
hold on;
grid on;

% Plot SR
line(1)=plot(x_labels, SR1, '-.o', 'LineWidth', 1.5,'Color', color(1), 'DisplayName', 'SGPI-Deep, SR');
line(2)=plot(x_labels, SR2, '-.s', 'LineWidth', 1.5, 'Color', color(2),'DisplayName', 'SGPI-Ger, SR');
line(3)=plot(x_labels, SR3, '-.^', 'LineWidth', 1.5, 'Color', color(3),'DisplayName', 'SGPI-fixed, SR');

% Plot CRB
line_CRB(1)=plot(x_labels, CRB1, '--<', 'LineWidth', 1.5,'Color', color(1), 'DisplayName', 'SGPI-Deep, CRLB');
line_CRB(2)=plot(x_labels, CRB2, '-->', 'LineWidth', 1.5,'Color', color(2), 'DisplayName', 'SGPI-Ger, CRLB');
line_CRB(3)=plot(x_labels, CRB3, '--v', 'LineWidth', 1.5,'Color', color(3), 'DisplayName', 'SGPI-fixed, CRLB');

% Plot Weighted Sum (WS)
line_OV(1)=plot(x_labels, WS1, '-d', 'LineWidth', 1.5, 'Color', color(1), 'DisplayName', 'SGPI-Deep, OV');
line_OV(2)=plot(x_labels, WS2, '-x', 'LineWidth', 1.5, 'Color', color(2), 'DisplayName', 'SGPI-Ger, OV');
line_OV(3)=plot(x_labels, WS3, '-p', 'LineWidth', 1.5, 'Color', color(3), 'DisplayName', 'SGPI-fixed, OV');

% Labeling
xlabel('Number of Communications Users');
ylabel('Metric Values');

lgd1 = legend(line, 'Location', 'NorthWest');
title(lgd1, 'Sum Rate (nats/Hz)');
axesNew1=axes('position',get(gca,'position'),'visible','off');
lgd2 = legend(axesNew1,line_CRB, 'Location', 'NorthEast');
title(lgd2, 'CRLB');
axesNew=axes('position',get(gca,'position'),'visible','off');
lgd3 = legend(axesNew,line_OV, 'Location', 'SouthEast');
title(lgd3, 'Objective Value');

