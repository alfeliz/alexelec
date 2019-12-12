# alexelec
Octave script to obtain resistance simulated from ALEX data.

## File list:
- alexraw04.m Octave script to extract electrical data from scope channels.
- baseline.m Function used by "alexraw04.m" to remove the baseline on a signal.
-  chan.m Function used by "alexraw04.m" to extract data from scope channel files.
- display_rounded_matrix.m Function used by "alexraw04.m" to save data in a readable and nice way.
- supsmu.m Function used by "alexraw04.m" to smooth correctly data (It uses a filter).

## Workflow:
1) Run once "alexsim.m" to find the adequate Ltot.
2) Save the files for the current and time.
3) Use "test02.m" to adjust the current to I_0 * exp(-gamma .*t) * sin(omega *t).
4) Calculate from omega and gamma the A and B values.
5) Use thes A and B values to adjust the voltage and with the resistance as A + (B * Cotg(w t) ) with the help of "alexsim.m" 
