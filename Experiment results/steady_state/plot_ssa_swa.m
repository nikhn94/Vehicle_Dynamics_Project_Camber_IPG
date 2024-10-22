clear all;
close all;


data = cell(1,5);

for i = 1:2
    filename_pos = [num2str(5*i),'pos_camber.CSV'];
    filename_neg = [num2str(5*i),'neg_camber.CSV'];
    data{i} = importdata(filename_pos);
    data{i+2} = importdata(filename_neg);
end
data{5} = importdata('Neutral_camber.CSV');

%% alpha_ay
figure(10);
for i = 1:size(data,2)   
    hold on;
    plot(data{i}.data(900:end-500,7), data{i}.data(900:end-500,3)*180/pi,'LineWidth',2);
end
title('Steady State: \beta vs a_y');
xlabel("Lateral acceleration a_y [m/s^2]");
ylabel("Side slip angle \beta [deg]");
grid on;
grid minor;
legend('\gamma= 5\circ','\gamma= 10\circ','\gamma= -5\circ','\gamma= -10\circ','neutral','Location','Northwest');
axis([-2 10 -0.2 1.2]);
%% torque-ay
figure(11);
for i = 1:size(data,2)   
    hold on;
    plot(data{i}.data(800:end-500,7), data{i}.data(800:end-500,9)*180/pi,'LineWidth',2);
end
title('Steady State: \tau vs a_y');
xlabel("Lateral acceleration a_y [m/s^2]");
ylabel("Steering torque \tau [Nm]");
grid on;
grid minor;
legend('\gamma= 5\circ','\gamma= 10\circ','\gamma= -5\circ','\gamma= -10\circ','neutral','Location','Southeast');

%% ay-delta
figure(12);
for i = 1:size(data,2)   
    hold on;
    %plot(data{i}.data(1000:end-500,7), data{i}.data(1000:end-500,8)*180/pi,'LineWidth',2);
    plot(data{i}.data(800:end-500,8)*180/pi, data{i}.data(800:end-500,7),'LineWidth',2);
end
grid on;
grid minor;
legend('\gamma= 5\circ','\gamma= 10\circ','\gamma= -5\circ','\gamma= -10\circ','neutral','Location','Southeast');
xlabel("Steering angle \delta [deg]");
ylabel("Lateral acceleration a_y [m/s^2]");
title("Steady state \delta vs a_y");
%axis([-2 10 -20 140]);
%% yaw rate -delta
figure(2);
for i = 1:size(data,2)   
    hold on;
    %plot(data{i}.data(1000:end-500,7), data{i}.data(1000:end-500,8)*180/pi,'LineWidth',2);
    plot(data{i}.data(800:end-500,6),data{i}.data(800:end-500,8)*180/pi,'LineWidth',2);
end
grid on;
grid minor;
legend('\gamma= 5\circ','\gamma= 10\circ','\gamma= -5\circ','\gamma= -10\circ','neutral','Location','Southeast');
xlabel("Steering angle \delta [deg]");
ylabel("Yaw rate [rad/sec]");
title("Steady state \delta vs Yaw rate");
axis tight
