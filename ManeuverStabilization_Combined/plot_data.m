time = logs.Time;
quat_w = logs.Data(1,:);
quat_x = logs.Data(2,:);
quat_y = logs.Data(3,:);
quat_z = logs.Data(4,:);
Q = [quat_w; quat_x; quat_y; quat_z];

figure;
hold on;
colors = ['r', 'g', 'b', 'k'];
labels = {'q1', 'q2', 'q3', 'q4'};

for i = 1:4
    plot(time, Q(:,i), 'o-', 'Color', colors(i), 'DisplayName', labels{i}, 'LineWidth', 1.5);
end

xticks(0:3);
xticklabels({'w', 'x', 'y', 'z'});
xlabel('Component');
ylabel('Value');
title('Quaternion Components');
legend show;
grid on;
hold off;