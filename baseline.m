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
## @deftypefn {Function File} {} baseline (@var{vec})
##   Returns the value of flat points media at the beginning of a vector.
##
## @code{[standard,media,points] = baseline (@var{vec})} returns three parameters,
## Standard deviation (@var{standard}), media value (@var{media}) and
## the number of points (@var{points}) used in the calculations from the total of points of the input vector, @var{vec}.
## @end deftypefn

## Author: Gonzalo Rodríguez Prieto (gonzalo#rprietoATuclm#es)
##       (Mail: change "#" by "." and "AT" by "@")
## Created: May 2013


############################################################################################
#
#               OCTAVE FUNCTION TO FIND THE BASELINE OF A DATA VECTOR.
#			IT RETURNS THE STANDARD DEVIATION, THE MEDIA OF THESE  POINTS 
#				AND THE NUMBER OF POINTS USED.
#
#                                     Version 1.00
#
############################################################################################

%When passing "varargin" as arguments, 
%it is taken a a cell of 1X1 dimensions, with all the elements there.
%that's why the function "parseparams" is used:

function [standar,media,points] = baseline(varargin)

[numbers,prop] = parseparams(varargin);

#Passing the cell structure to numbers:
numbers = numbers{:};

fin = length(numbers); #find the number of points


###
#Check now if there are equal values between the vector 
# (will produce errors in the mean and standard functions):
###

#Make the difference between the vector points:
zer = diff(numbers);
#If so, give special exit:
if (any(eq(zer,0)))
 warning("baseline: Input vector with some values equal, not possible to make habitual mean or standard deviation.");
 media = sum(numbers(1:fin))/fin;
 standar = 0;
 points = fin;
 return;
endif

##
#Normal vector, normal calculations:
# Calculate the mean for the total numbers of points in the vector. 
# Reduce the number of ppints in the calculations until standar 
# deviation is less than 0.21 times mean.
# So we assure that we produce a number (mean) that is 
#  the constant initial value of the beginning of the vector.
##

do
 if (fin==0)
   return;
 endif;
 media = mean(numbers(1:fin));
 standar = std(numbers(1:fin));
 points = fin;
 if (fin>10)
   fin = fin - 10;
 elseif (fin<=10)
   fin = fin - 1;
 endif;
until (standar <= 0.21*abs(media))



endfunction;

#That's...that's all folks!!!
