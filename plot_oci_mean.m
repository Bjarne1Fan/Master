close all;

orbital_period = (2.06 - 1.505) *10^4;

 oci = out.oci_mean.Data(1:6, :);
 mean = out.oci_mean.Data(7:12, :);


 
 figure(1);

 plot(out.oci_mean.Time, oci(1,:));
 hold on;

 plot(out.oci_mean.Time, mean(1,:));

legend('Oscillating $\alpha$', 'Mean $\alpha$', 'Interpreter','latex');
title('Oscillating and Mean Semi-major-axis')
ylabel('semi-major-axis [km]')
xlabel('Time [s]')
grid on;
hold off;


figure(2);

 plot(out.oci_mean.Time, oci(2,:));
 hold on;

 plot(out.oci_mean.Time, mean(2,:));

legend('Oscillating $e$', 'Mean $e$', 'Interpreter','latex');
title('Oscillating and Mean Eccentricity')
ylabel('Eccentricity')
xlabel('Time [s]')
grid on;
hold off;
