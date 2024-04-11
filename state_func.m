%x_f is assumed to be constant for the prediction interval
function dxdt = state_func(x,u, x_f, rho)
    %temp consants
    %x_f = [500*10^3; 2; 0.001 ; 0.001 ; 0.01 ; 0.01];
    %rho = 1;

    G               = 6.6743 * 10^(-11);
    earth_mass      = 5.972 * 10^24;
    mu              = G*earth_mass;
    J_2             =  1.08263 * 10^(-3);
    R_E             = 6371*10^3; % 6371km

    a_c     = x_f(1);
    e_c     = x_f(2);
    i_c     = x_f(3);
    omega_c = x_f(4);
    %Omega_c = x_f(5);
    %Nu_c    = x_f(6);

    B       = u(1);
    B_f     = u(2);

    A       = (3/2) * sqrt( ( (1 + x(1))^7 *mu)/(a_c^7) );
    I       = 3 + 5 *cos(2*(i_c - x(5)) );
    J       = J_2 * R_E^2;
    
    f_x     = zeros(6,1);
    f_x(1)  = 0;
    f_x(2)  = -0.5*A*( (2*(a_c^2)*x(1)) /(1 + x(1))^2 + 7*J*sin(2*(i_c - x(5))*x(5)));
    f_x(3)  = -0.25 * J * A *I * x(4);
    f_x(4)  = 0.25 * J * A *I * x(3);
    f_x(5)  = 0;
    f_x(6)  = J * A * sin(i_c - x(5))^2 * x(5);

    rho_c   = rho;

    betta   = B*f(e_c)*rho;
    betta_c = B_f *f(e_c) * rho_c;
    E       = sqrt(e_c^2 + x(3)^2 + x(4)^2 - 2*e_c*(x(3)*cos(omega_c) + x(4)*sin(omega_c)));

    g_x     = zeros(6,1);    
    g_x(1)  = (1 + x(1))*(betta_c/(1-e_c) + betta/(E-1));
    g_x(2)  = 0;
    g_x(3)  = betta_c * cos(omega_c) + E^-1 * betta*( x(3) - e_c*cos(omega_c));
    g_x(4)  = betta_c * sin(omega_c) + E^-1 * betta*( x(4) - e_c*sin(omega_c));
    g_x(5)  = 0;
    g_x(6)  = 0;

    dxdt = f_x + g_x;

end


function f = f(e)
    f = 1.61*10^4*e^0.02701 -1.61*10^4;
end