goption vsize=8cm hsize=10cm;
data a;
input x@@;
t=_n_-1;
t2=t**2;
t3=t**3;
t4=t**4;
cards;
0.6
1.5
2.8
3.9
5.0
6.7
7.9
11.1
15.1
19.4
26.6
40.5
29.7
46.4
64.8
100.8
172.6
240.9
164.1
110.9
174.9
243.5
299.4
370.1
459.2
422.2
524.7
524.4
723.8
869.3
1065.4
1232.1
1239.0
1278.1
1378.9
1460.2
1322.2
1395.7
1672.2
1740.2
1802.5
1879.7
1979.5
2047.9
1956.3
2272.8
2548.1
2809.0
2821.0
3010.0
3251.0
3186.0
3383.0
3791.0
3881.3
4804.8
5177.9
5345.1
5825.0
6012.7
;
proc gplot;
plot x*t=1 ;
symbol1 c=black v=star i=none;
run;
proc reg ;
model x=t t2;
output out=out p=x_cup;
proc gplot data=out;
plot x*t=2 x_cup*t=3/overlay;
symbol2 c=black v=star i=none;
symbol3 c=red v=none i=join w=2;
run;
