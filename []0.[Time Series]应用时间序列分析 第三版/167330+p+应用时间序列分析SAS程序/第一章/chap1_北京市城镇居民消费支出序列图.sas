goptions ftext=swissb;

data a;
  input  expend;
  time=intnx('year','1jan1990'd,_n_-1);
  cards;
1686
1925
2356
3027
3891
4874
5430
5796
6217
6796
;
proc gchart data=a;
  format time year4.;
  axis1 minor=none label=('expend') offset=(0,0);
  vbar3d time / sumvar=expend discrete  raxis=axis1 inside=sum
                coutline=black cframe=yellow width=5;

run;
