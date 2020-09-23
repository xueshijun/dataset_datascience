data a;
input returns@@;
dif=dif(returns);
r2=dif**2;
y=log(returns);
dify=dif(y);
time=intnx('month','1apr1963'd,_n_-1);
format time year4.;
cards;
0.00238	0.00238	0.00236	0.0025	0.00254	0.0026	0.00285	0.00281
0.00241	0.00288	0.00287	0.00292	0.00294	0.00273	0.00271	0.00282
0.00267	0.00273	0.00293	0.00285	0.00296	0.00281	0.00326	0.00321
0.00315	0.00319	0.00313	0.00313	0.00319	0.00313	0.0033	0.00319
0.00315	0.00355	0.0037	0.00371	0.00364	0.00381	0.00372	0.00368
0.00374	0.00389	0.00415	0.00389	0.00343	0.00377	0.00368	0.00364
0.00338	0.00283	0.00271	0.003	0.00309	0.00317	0.00343	0.00347
0.00355	0.0036	0.00398	0.00385	0.00389	0.00444	0.00453	0.00444
0.00432	0.00406	0.00432	0.00461	0.00398	0.005	0.00487	0.0047
0.00432	0.00508	0.00478	0.00508	0.00593	0.0055	0.00593	0.00542
0.0054	0.0054	0.00631	0.00534	0.00546	0.00542	0.00546	0.00495
0.005	0.00508	0.00483	0.00444	0.00377	0.00355	0.00338	0.00264
0.00283	0.00305	0.00338	0.00406				
;
proc gplot;
plot returns*time dif*time r2*time y*time dify*time;
symbol c=black i=join v=none;
proc arima;
identify var=returns ;
identify var=y(1);
estimate p=0 q=0 noint;
forecast lead=0 id=time  out=out;
data out;
merge a out;
by time;
estimate=exp(y);
proc gplot;
plot returns*time=1 estimate*time=2 /overlay;
symbol1 c=black i=none v=star h=0.5;
symbol2 c=red i=join v=none;
run;
