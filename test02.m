###########################################################################################
#
#
#  OCTAVE SCRIPT TO:
# Try to fit intensity values to an exponential decay function. It is not possible. 
#It will be done by hand.
#
#
###########################################################################################

clear;

tic;

#Read data
t0 = load("t103.txt"); %Time vector (µs)
t = t0(t0>-0.0); %Take part with real data.
t = t - 0.2;
cur = load("curr103.txt"); %Current vector (A/s) 
cur = cur(t0>-0.0); %Take part with real data.

Ltot = 7.4987e-08; %nHrs
C = 2.27e-6; %Farads. Total capacity of the circuit. Measured and written in page 21 of "Logbook Exploding Wire".

par_sol = [max(cur)*1.1, 0.11, 1.8 ]; %Parameters for adjusting current.

cur2 = par_sol(1).*exp(-par_sol(2)*t).*sin(par_sol(3)*t);

err = abs((cur-cur2)./cur);

figure;plot(t,cur,"+k");hold;plot(t,cur2,"*r");




toc;


