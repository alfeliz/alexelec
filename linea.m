## Copyright (C) 2015 Gonzalo Rodríguez Prieto
##
## This file is  free software.
##
## It is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied
## warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the GNU General Public License for more
## details.

## -*- texinfo -*-
## @deftypefn {Function File} {} linea (@var{ttot}, @var{period}, @var{a}, @var{b}, @var{frec})
##   Returns the value of the function A + B * Cotangent(frec.*t). To be used
## for resistance approximations in ALEX data.
## @code{[resistance] = linea (@var{ttot}, @var{period}, @var{a}, @var{b}, @var{frec})} returns the commented value, with
## @var{ttot} the total time of the function, starting in 0.1 microseconds, @var{period} the temporal distance between time points, 
## @var{a} the previous "a" constant, @var{b} the previous "b" constant, and @var{frec} the frecuency of the cotangent.
## @end deftypefn

## Author: Gonzalo Rodríguez Prieto (gonzalo#rprietoATuclm#es)
##       (Mail: change "#" by "." and "AT" by "@")
## Created: April 2015
##########################################################################
# Function to make a cotg line.
#  Variables:
#	ttot: total time of the function, from 0.1 .
#	period: period of the time vector.
#	a,b: constants.
#	frec: frecuency of the circuit.
##########################################################################

function [y] = linea(ttot,period,a,b,frec)

t = [0.1:period:ttot]; %Time in µs


y = a + b.*cot(frec.*t);

y = y(y>=0); %Taking the positive part (Is for a resistance...)

%y = y(y<2); %Taking no infinitive resistance.

endfunction;


