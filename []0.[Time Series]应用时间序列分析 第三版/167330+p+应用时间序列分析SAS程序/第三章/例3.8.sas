goption vsize=8cm hsize=10cm;
data a;
input year x @@;
cards;
1950	15.71 
1951	24.43 
1952	18.23 
1953	22.50 
1954	12.53 
1955	9.94 
1956	7.19 
1957	41.13 
1958	79.03 
1959	119.32 
1960	-12.10 
1961	-89.71 
1962	-52.26 
1963	20.01 
1964	19.92 
1965	42.81 
1966	18.78 
1967	-0.75 
1968	-1.08 
1969	5.09 
1970	26.39 
1971	31.09 
1972	19.78 
1973	2.56 
1974	12.95 
1975	15.54 
1976	3.97 
1977	2.42 
1978	0.31 
1979	-5.10 
1980	-7.52 
1981	-7.69 
1982	1.61 
1983	4.46 
1984	10.97 
1985	15.15 
1986	6.00 
1987	-0.90 
1988	-3.22 
1989	-8.54 
1990	6.76 
1991	-0.83 
1992	4.67 
1993	11.68 
1994	0.82 
1995	8.54 
1996	24.51 
1997	28.91 
1998	44.94 
1999	11.16 
2000	11.08 
2001	15.75 
2002	-0.31 
2003	20.99 
2004	6.50 
2005	10.45 
2006	-3.51 
2007	23.42 
2008	17.99 
;
proc gplot data=a;
plot x*year=1 ;
symbol1 c=black i=join v=star;
run;
proc arima;
identify var=x minic;
estimate p=5 method=mle;
forecast id=year lead=5 out=out;
proc gplot data=out;
plot x*year=2 forecast*year=3 l95*year=4 u95*year=4/overlay;
symbol2 c=black i=none v=star;
symbol3 c=red i=join v=none;
symbol4 c=green i=line v=none l=2;
run;
