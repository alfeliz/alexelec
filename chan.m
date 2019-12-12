## Copyright (C) 2013 Gonzalo Rodríguez Prieto
##
## This file is  free software.
##
## It is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied
## warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the GNU General Public License for more
## details.


## -*- texinfo -*-
## @deftypefn {Function File} {} chan ()
##   Returns the value of the data in a CSV Tektronik scope file named 
## "channame"
##
## @code{[t,vol,points] = chan (@var{channame})} returns two vectors, t and vol, 
## with the time and voltage data and the number of points in the file (points)
## @end deftypefn

## Author: Gonzalo Rodríguez Prieto (gonzalo#rprietoATuclm#es)
##       (Mail: change "#" by "." and "AT" by "@")
## Created: May 2013

function [t,vol,points] = chan(channame)

if (ischar(channame)!=1)
 error("chan: The name must be a string!");
endif;

#Reading the file and placing the data in a "cell" structure. 
[fileid, msg] = fopen(channame,'r'); 

if (fileid == -1) 
   error ("chan: Unable to open file name: %s, %s",channame, msg); 
endif; 
r_rows =  "%s %f %f %f %f";
if feof(fileid)==0 #Read the file until it finds the EndOfFile character.
   data = textscan(fileid, r_rows, "delimiter", ",", "endofline", "");
endif;
fclose(fileid);

#Transforming the data in numbers:
t = cell2mat(data(:,4)); #Time vector (in seconds)

vol = cell2mat(data(:,5)); #Voltage channel value (in volts)
vol = supsmu(t,vol,"span",0.01); #Smoothing the voltage to work with it.

points = length(vol);


endfunction;

#That's...that's all folks!!!
