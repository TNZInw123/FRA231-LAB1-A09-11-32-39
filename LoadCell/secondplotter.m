clf('reset');
linetype1 = '-* ';
linetype2 = '-';

GAIN = 609.4;

ax_1 = subplot(2,2,1);
ax_2 = subplot(2,2,3);
ax_3 = subplot(2,2,4);

titles = ["Output Voltage From Input Weight", "Ratio Technique", "Linear Equation Technique"];
ax = [ax_1, ax_2, ax_3];
c = 'rcg';

sgtitle('Load Cell 2nd Iteration Graph', 'Interpreter','latex');

for i = 1
    plot(ax(i), NewDataTable.("Weight(g)"), NewDataTable.("Voltage(V)"), [c(i) linetype1], 'LineWidth', 1.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Weight Input (g)');
    ylabel(ax(i), 'Voltage Output (V)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", Location="southeast");
end

for i = 2
    plot(ax(i), NewDataTable.("Voltage(V)"), NewDataTable.("Ratio Measured (g)"), [c(i) linetype1], 'LineWidth', 1.5);
    hold(ax(i),"on");

    plot(ax(i), NewDataTable.("Voltage(V)"), NewDataTable.("Weight(g)"), ['k' linetype2], 'LineWidth', 0.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Voltage Input (V)');
    ylabel(ax(i), 'Weight (g)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", "Input Weight", Location="southeast");
end

for i = 3
    plot(ax(i), NewDataTable.("Voltage(V)"), NewDataTable.("Linear Measured (g)"), [c(i) linetype1], 'LineWidth', 1.5);
    hold(ax(i),"on");

    plot(ax(i), NewDataTable.("Voltage(V)"), NewDataTable.("Weight(g)"), ['k' linetype2], 'LineWidth', 0.5);
    title(ax(i), titles(i));

    xlabel(ax(i), 'Voltage Input (V)');
    ylabel(ax(i), 'Weight (g)');
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    legend(ax(i), "Measured", "Input Weight", Location="southeast");
end

set(gcf, "Color", 'w')
