goptions vsize=7cm hsize=10cm;
data a;
input year x@@;
dif=dif(x);
cards;
1917	183.1
1918	183.9
1919	163.1
1920	179.5
1921	181.4
1922	173.4
1923	167.6
1924	177.4
1925	171.7
1926	170.1
1927	163.7
1928	151.9
1929	145.4
1930	145
1931	138.9
1932	131.5
1933	125.7
1934	129.5
1935	129.6
1936	129.5
1937	132.2
1938	134.1
1939	132.1
1940	137.4
1941	148.1
1942	174.1
1943	174.7
1944	156.7
1945	143.3
1946	189.7
1947	212
1948	200.4
1949	201.8
1950	200.7
1951	215.6
1952	222.5
1953	231.5
1954	237.9
1955	244
1956	259.4
1957	268.8
1958	264.3
1959	264.5
1960	268.1
1961	264
1962	252.8
1963	240
1964	229.1
1965	204.8
1966	193.3
1967	179
1968	178.1
1969	181.1
1970	165.6
1971	159.8
1972	136.1
1973	126.3
1974	123.3
1975	118.5
;
proc gplot;
plot x*year dif*year;
symbol c=black i=join v=square;
proc arima;
identify var=x(1);
estimate p=(1 4) noint;
forecast lead=5 id=year out=out;
proc gplot data=out;
plot x*year=1 forecast*year=2 l95*year=3 u95*year=3/overlay;
symbol1 c=black i=none v=star;
symbol2 c=red i=join v=none;
symbol3 c=green i=join v=none;
run;
