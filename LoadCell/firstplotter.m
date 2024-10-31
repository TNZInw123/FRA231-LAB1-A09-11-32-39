clf('reset');
linetype1 = '-* ';
linetype2 = '-';

GAIN = 609.4;

ax_1 = subplot(2,2,1);
ax_2 = subplot(2,2,2);
ax_3 = subplot(2,2,3);

titles = ["Output Voltage From Input Weight", "Voltage Before & After Amplifier", "Ratio Technique"];
ax = [ax_1, ax_2, ax_3];
c = 'rgc';

sgtitle('Load Cell 1st Iteration Graph', 'Interpreter','latex');

for i = 1
    plot(ax(i), DataTable.("Weight(g)"), DataTable.("Amplified Voltage(V)"), [c(i) linetype1], 'LineWidth', 1.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Weight Input (g)');
    ylabel(ax(i), 'Voltage Output (V)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", Location="southeast");
end

for i = 2
    plot(ax(i), DataTable.("Pure Voltage(mV)"), DataTable.("Amplified Voltage(V)"), [c(i) linetype1], 'LineWidth', 1.5);
    hold(ax(i),"on");
    
    plot(ax(i), DataTable.("Pure Voltage(mV)"), (DataTable.("Pure Voltage(mV)") * GAIN)/1000, ['k' linetype2], 'LineWidth', 0.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Pure Voltage(mV)');
    ylabel(ax(i), 'Amplified Voltage(V)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", "Theory", Location="southeast");
end

for i = 3
    plot(ax(i), DataTable.("Amplified Voltage(V)"), DataTable.("Measured 2(g)"), [c(i) linetype1], 'LineWidth', 1.5);
    hold(ax(i),"on");

    plot(ax(i), DataTable.("Amplified Voltage(V)"), DataTable.("Weight(g)"), ['k' linetype2], 'LineWidth', 0.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Voltage Input (V)');
    ylabel(ax(i), 'Weight (g)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", "Input Weight", Location="southeast");
end

set(gcf, "Color", 'w')
