data grain;
year=intnx('year','01jan1852'd,_n_-1);
input yield@@;
cards;
1.66 1.53 3.23 2.26 2.27 3.06 2.68 2.31 1.78 2.51 2.23 3.86 3.18 2.71
 1.81 1.68 2.82 1.94 2.73 2.16 2.17 1.59 2.58 1.93 1.82 1.27 2.13 1.21
 2.30 1.92 2.33 2.52 2.43 1.91 2.63 1.91 2.27 1.82 3.17 2.59 2.11 1.20
 3.39 2.07 2.48 2.00 2.01 1.87 2.00 2.11 2.59 1.86 1.52 3.05 3.18 2.55
 2.64 2.20 1.93 2.27 0.52 1.44 1.49 2.60 1.61 1.97 1.90 2.06 2.02 1.35
 1.62 1.05 0.99 1.63
;
proc gplot;
plot yield*year;
format year year4.;
symbol c=red v=square i=spline;
run;
