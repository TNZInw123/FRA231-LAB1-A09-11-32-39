linecolor_b = [0 0.4470 0.7410]; % กำหนดสีเพื่อแสดงความชัดเจนของเส้นกราฟ
linecolor_r = [0.6350 0.0780 0.1840]; 
linecolor_g = [0.4660 0.6740 0.1880];

figure;

x1 = (-35:1:0)'; 
plot(x1, valNNS, '--o', 'Color', linecolor_b, 'LineWidth', 1.5, 'MarkerSize', 2, 'MarkerFaceColor', linecolor_b); % วาดกราฟเส้น
hold on; % คงกราฟไว้
plot(x1, valNS, '-o', 'Color', linecolor_b, 'LineWidth', 1.5, 'MarkerSize', 2, 'MarkerFaceColor', linecolor_b);

x2 = (0:1:35)'; 
plot(x2, flip(valSNS), '--o', 'Color', linecolor_r, 'LineWidth', 1.5, 'MarkerSize', 2, 'MarkerFaceColor', linecolor_r);
plot(x2, flip(valSS), '-o', 'Color', linecolor_r, 'LineWidth', 1.5, 'MarkerSize', 2, 'MarkerFaceColor', linecolor_r);

legend(["North No Shield", "North Shield", "North Shield Ground Setup", "South Shield Ground Setup", "South No Shield", "South Shield"], 'Location', 'southeast'); % สร้างคำอธิบายของกราฟ

xticks(-35:5:35); 
xticklabels({"0 (N)", "5", "10", "15", "20", "25", "30", "35", "30", "25", "20", "15", "10", "5", "0 (S)"}); % กำหนดตำแหน่งและข้อความของ X-ticks
yticks(0:250:3500); % กำหนดตำแหน่งของ Y-ticks

xlabel('Distance (mm)'); % ตั้งชื่อแกน X
ylabel('Output Voltage (mV)'); % ตั้งชื่อแกน Y
title('Output Voltage Characteristics of a Hall Effect Sensor with North and South Poles'); % ตั้งชื่อกราฟ

hold off;
grid on; % เปิดใช้งานตารางในกราฟ
