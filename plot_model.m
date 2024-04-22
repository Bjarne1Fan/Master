close all;


 ballisitc = out.ballistic;
 mv_ballistic_leader = out.ballistic.Data(:,1);
 mv_ballistic_follower = out.ballistic.Data(:,2);

 plant_ballistic_leader = out.ballistic.Data(:,3);
 plant_ballistic_follower = out.ballistic.Data(:,4);

 figure(1);

 plot(out.ballistic.Time, mv_ballistic_leader);
 hold on;

 plot(out.ballistic.Time, mv_ballistic_follower);

legend('$B_l$', '$B_f$','Interpreter','latex');
title('Ballistic coeficcent from NMPC')
ylabel('Ballistic coefficent in [m^2/kg]')
xlabel('time [s]')
grid on;
hold off;


 figure(2);

 plot(out.ballistic.Time, plant_ballistic_leader);
 hold on;

 plot(out.ballistic.Time, plant_ballistic_follower);

legend('$B_l$', '$B_f$','Interpreter','latex');
title('Ballistic coeficcent from plant')
ylabel('Ballistic coefficent in [m]')
xlabel('time [s]')
grid on;
hold off;


figure(3);

a_rel      = out.states.Data(:,1)*a_leader;
lambda_rel = out.states.Data(:,2)*a_leader;

plot(out.states.Time, a_rel);
hold on;

plot(out.states.Time, lambda_rel);

hold on;
sz = size(lambda_rel, 1);
ref_vec = ones(sz,1);
ref_vec = ref_vec * (-20);
plot(out.states.Time, ref_vec);

legend('$\delta a \cdot a_l$', '$\delta \lambda \cdot a_l$', '$\lambda_{ref} \cdot a_l$','Interpreter','latex');
title('Relative semi-major-axis and lambda')
ylabel('Relative distance in [m]')
xlabel('Time [s]')
grid on;
hold off;