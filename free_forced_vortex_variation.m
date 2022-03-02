c           = 1;
omega       = 1;
r           = 0:0.05:1;
v_forced    = omega*r;
v_free      = c./r;
rho         = 1.225;
r_atm       = 1;
p_atm       = 1;
v_free_atm  = c/r_atm;

% Static and Total Pressure Variation:
P_static_free   = p_atm + (rho/2)*(v_free_atm^2 - v_free.^2);
P_static_forced = rho*omega*0.5*r.^2;
P_stag_free     = P_static_free + 0.5*rho*v_free.^2;
P_stag_forced   = P_static_forced + 0.5*rho*v_forced.^2;

figure(1)
hold on
grid on
yyaxis left
plot(r,P_static_free)
yyaxis right
plot(r,P_static_forced)
legend('Free Vortex','Forced Vortex')
title('Static Pressure Variation (N/m^2)')
hold off

figure(2)
hold on
grid on
plot(r,P_stag_free)
plot(r,P_stag_forced)
legend('Free Vortex','Forced Vortex')
title('Stagnation Pressure Variation (N/m^2)')
hold off

% Vorticity and Circulation Variation:
vor_free    = 0;
vor_forced  = 2*omega;
cir_free    = 2*pi*c;
cir_forced  = 2*pi*(r.^2)*omega;

figure(3)
hold on
grid on
yline(vor_free)
yline(vor_forced)
legend('Free Vortex','Forced Vortex')
title('Vorticity Variations')
hold off

figure(4)
hold on
grid on
yline(cir_free)
plot(r,cir_forced)
legend('Free Vortex','Forced Vortex')
title('Circulation Variations')
hold off