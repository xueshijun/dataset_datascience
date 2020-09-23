goption vsize=8cm hsize=10cm;
data example4_4;
input x@@;
t=1949+_n_-1;
cards;
54167	55196	56300	57482	58796	60266	61465	62828	64653	65994
67207	66207	65859	67295	69172	70499	72538	74542	76368	78534
80671	82992	85229	87177	89211	90859	92420	93717	94974	96259
97542	98705	100072	101654	103008	104357	105851	107507	109300	111026
112704	114333	115823	117171	118517	119850	121121	122389	123626	124761
125786	126743	127627	128453	129227	129988	130756	131448	132129	132802
;
proc gplot;
plot x*t=1;
symbol1 i=join v=none  c=black; 
run;
proc forecast data=example4_4 method=stepar trend=2 lead=5 
              out=out outfull outest=est; 
   id t; 
   var x; 
proc gplot data=out; 
 plot x*t= _type_ / href=2008;
   symbol1 i=none   v=star  c=black; 
   symbol2 i=join v=none  c=red; 
   symbol3 i=join v=none  c=green l=2; 
   symbol4 i=join v=none  c=green l=2; 
run; 
