close all;

% Extract time and data from logs
time = logs.Time;

% Quaternion components
quat_w = logs.Data(1,:);  
quat_x = logs.Data(2,:);  
quat_y = logs.Data(3,:);  
quat_z = logs.Data(4,:);  

% Angular velocity components
omega_x = logs.Data(5,:);  
omega_y = logs.Data(6,:);  
omega_z = logs.Data(7,:);  

% Position components
pos_x = logs.Data(8,:);  
pos_y = logs.Data(9,:);  
pos_z = logs.Data(10,:);  % Fixed index from §0 to 10

% -------------------------------------
% === Filter Data After 5 Seconds ===
% -------------------------------------
idx = time > 8;
time = time(idx);

quat_w = quat_w(idx);  
quat_x = quat_x(idx);  
quat_y = quat_y(idx);  
quat_z = quat_z(idx);  

omega_x = omega_x(idx);  
omega_y = omega_y(idx);  
omega_z = omega_z(idx);  

pos_x = pos_x(idx);  
pos_y = pos_y(idx);  
pos_z = pos_z(idx);

% -------------------------------------
% === Plot 1: Quaternion Components ===
% -------------------------------------
Q = [quat_w; quat_x; quat_y; quat_z];
quat_labels = {'q_w', 'q_x', 'q_y', 'q_z'};
quat_colors = [0.2 0.6 0.8; 0.8 0.4 0.4; 0.4 0.8 0.4; 0.6 0.4 0.8];  % Blue, Red, Green, Purple

figure('Position', [100, 100, 800, 500]);
for i = 1:4
    subplot(2, 2, i);
    plot(time, Q(i,:), 'LineWidth', 2, 'Color', quat_colors(i,:));
    title(['Quaternion ' quat_labels{i}], 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('Value', 'FontSize', 10);
    grid on;
    axis tight;
end
sgtitle('Quaternion Components', 'FontSize', 14, 'FontWeight', 'bold');
set(gcf, 'Color', 'w');

% -------------------------------------
% === Plot 2: Angular Velocities ===
% -------------------------------------
omega = [omega_x; omega_y; omega_z];
omega_labels = {'\omega_x', '\omega_y', '\omega_z'};
omega_colors = [0.9 0.4 0.4; 0.4 0.9 0.4; 0.4 0.4 0.9];  % Red, Green, Blue

figure('Position', [100, 650, 800, 400]);
for i = 1:3
    subplot(1, 3, i);
    plot(time, omega(i,:), 'LineWidth', 2, 'Color', omega_colors(i,:));
    title(['Angular Velocity ' omega_labels{i}], 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('rad/s', 'FontSize', 10);
    grid on;
    axis tight;
end
sgtitle('Angular Velocities', 'FontSize', 14, 'FontWeight', 'bold');
set(gcf, 'Color', 'w');

% -------------------------------------
% === Plot 3: Position Components ===
% -------------------------------------
pos = [pos_x; pos_y; pos_z];
pos_labels = {'x', 'y', 'z'};
pos_colors = [0.8 0.6 0.2; 0.2 0.8 0.6; 0.6 0.2 0.8];  % Gold, Teal, Purple

figure('Position', [100, 100, 800, 500]);
for i = 1:3
    subplot(1, 3, i);
    plot(time, pos(i,:), 'LineWidth', 2, 'Color', pos_colors(i,:));
    title(['Position ' pos_labels{i}], 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('m', 'FontSize', 10);
    grid on;
    axis tight;
end
sgtitle('Position Components', 'FontSize', 14, 'FontWeight', 'bold');
set(gcf, 'Color', 'w');

% -------------------------------------
% === Plot 4: 3D Position Trajectory ===
% -------------------------------------
figure('Position', [200, 200, 700, 600]);
plot3(pos_x, pos_y, -pos_z, 'LineWidth', 2, 'Color', [0.1 0.5 0.8]);
grid on;
xlabel('X (m)', 'FontSize', 12);
ylabel('Y (m)', 'FontSize', 12);
zlabel('Z (m)', 'FontSize', 12);
title('3D Position Trajectory', 'FontSize', 14, 'FontWeight', 'bold');
axis([-2 2 -2 2 0 2]);  % Set fixed axis limits
view(3);
set(gcf, 'Color', 'w');
