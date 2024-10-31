figure;
clf('reset');

linetype1 = '-* ';
linetype2 = '-';

sgtitle('2nd Iteration Potentiometer Characteristics Graph', 'Interpreter','latex');

Xaxes = FinalPercentTable.Travel;
Yaxes = [FinalPercentTable.RoA, FinalPercentTable.RoB, FinalPercentTable.RoC, FinalPercentTable.LiA, FinalPercentTable.LiB];
XError = (0:5:100);
for i = 1:21
    m = mod(i, 2);
    if m == 0
        XError(1,i) = nan;
    end
end

titles = ["Rotary Potentiometer A", "Rotary Potentiometer B", ...
         "Rotary Potentiometer C", "Slide Potentiometer A", ...
         "Slide Potentiometer B"];

ax_1 = subplot(2,3,1);
ax_2 = subplot(2,3,2);
ax_3 = subplot(2,3,3);
ax_4 = subplot(2,3,4);
ax_5 = subplot(2,3,5);
ax_6 = subplot(2,3,6);

ax = [ax_1, ax_2, ax_3, ax_4, ax_5, ax_6];
c = 'rgbmc';

for i = 1:5
    plot(ax(i), Xaxes, Yaxes(:,i), [c(i) linetype1], 'LineWidth', 1.5);
    hold(ax(i), "on");
    plot(ax(i), XTheory(:,i), YTheory(:,i), ['k' linetype2], 'LineWidth', 0.5);
    errorbar(ax(i), XError, YTheory(:,i), YTheory(:,i)*0.2,"vertical","Color",'k');
    hold(ax(i), "off");
    
    title(ax(i), titles(i));
    axis(ax(i), "padded");
    grid(ax(i), 'on');
    xlabel(ax(i), 'Rotational Travel (%)');
    ylabel(ax(i), 'VOut to VRef (%)');
    xticks(ax(i), 0:10:100);
    yticks(ax(i), 0:10:100);

    if i == 3
        legend(ax(i), "Measured", "Theory", Location="northeast");
    else
        legend(ax(i), "Measured", "Theory", Location="southeast");
    end
end

for i = 1:5
    plot(ax_6, Xaxes, Yaxes(:,i), [c(i) '-'], 'LineWidth', 1.5);
    hold(ax_6, "on")
end
hold(ax_6, "off")
axis(ax_6, "square");
grid(ax_6, 'on');
xlabel(ax_6, 'Rotational Travel (%)');
ylabel(ax_6, 'VOut to VRef (%)');
xticks(ax_6, 0:10:100);
yticks(ax_6, 0:10:100);
title(ax_6, 'All');

set(gcf, "Color", 'w')
