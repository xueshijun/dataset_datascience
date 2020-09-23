goptions vsize=8cm hsize=10cm;
data example5_3;
input x@@;
t=_n_;
cards;
10.77	13.30	16.64	19.54	18.97	20.52	24.36
23.51	27.16	30.80	31.84	31.63	32.68	34.90
33.85	33.09	35.46	35.32	39.94	37.47	35.24
33.03	32.67	35.20	32.36	32.34	38.45	38.17
32.14	39.70	49.42	47.86	48.34	62.50	63.56
67.61	64.59	66.17	67.50	76.12	79.31	78.85
81.34	87.06	86.41	93.20	82.95	72.96	61.10
61.27	71.58	88.34	98.70	97.31	97.17	91.17
80.20	85.12	81.40	70.87	57.75	52.35	67.50
87.95	85.46	84.55	98.16	102.42	113.02	119.95
122.37	126.96	122.79	127.96	139.20	141.05	140.87
137.08	145.53	145.59	134.36	122.54	106.92	97.23
110.39	132.40	152.30	154.91	152.69	162.67	160.31
142.57	146.54	153.83	141.81	157.83	161.79	142.07
139.43	140.92	154.61	172.33	191.78	199.27	197.57
189.29	181.49	166.84	154.28	150.12	165.17	170.32
��
proc gplot data=example5_3;
plot x*t=1;
symbol1 c=black i=join v=star;
proc autoreg data=example5_3;
model x=t/nlag=5  dwprob archtest;
model x=t/nlag=2 noint garch=(noint,p=1,q=1);
output  out=out p=p residual=residual lcl=lcl ucl=ucl cev=cev;
data out;
set out;
l95=-1.96*sqrt(51.42515);
u95=1.96*sqrt(51.42515);
Lcl_GARCH=-1.96*sqrt(cev);
Ucl_GARCH=1.96*sqrt(cev);
Lcl_p=p-1.96*sqrt(cev);
Ucl_p=p+1.96*sqrt(cev);
proc gplot data=out;
plot residual*t=2 l95*t=3 LCL_garch*t=4 u95*t=3 UCL_garch*t=4 /overlay;
plot x*t=5 lcl*t=3 LCL_p*t=4 ucl*t=3 UCL_p*t=4 /overlay;
symbol2 c=green i=needle v=none ;
symbol3 c=black i=join v=none w=2 l=2;
symbol4 c=red i=join v=none ;
symbol5 c=green i=join v=none ;
run;

