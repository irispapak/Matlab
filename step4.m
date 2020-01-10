
fid=fopen('/home/irida/Desktop/final2.txt','r');
C=textscan(fid,'%4.0f %5.0f %10.3f %10.3f %10.3f %10.3f %10.1f %10.1f %10.1f\n',307,'headerlines',1);
fclose(fid);
B=horzcat(C{:});

jan=zeros(26,6);feb=zeros(26,6);mar=zeros(26,6);apr=zeros(26,6);may=zeros(26,6);jun=zeros(25,6);
jul=zeros(25,6);aug=zeros(25,6);sep=zeros(25,6);oct=zeros(25,6);nov=zeros(26,6);dec=zeros(26,6);
a=1;b=1;c=1;d=1;e=1;f=1;g=1;h=1;i=1;j=1;k=1;l=1;

for w=1:307
   if B(w,2)==1
       jan(a,1)=B(w,4);
       jan(a,2)=B(w,5);
       jan(a,3)=B(w,6);
       jan(a,4)=B(w,7);
       jan(a,5)=B(w,8);
       jan(a,6)=B(w,9);
       a=a+1;
   elseif B(w,2)==2 
       feb(b,1)=B(w,4); 
       feb(b,2)=B(w,5);
       feb(b,3)=B(w,6);
       feb(b,4)=B(w,7);
       feb(b,5)=B(w,8);
       feb(b,6)=B(w,9);
       b=b+1;
   elseif B(w,2)==3
       mar(c,1)=B(w,4);
       mar(c,2)=B(w,5);
       mar(c,3)=B(w,6);
       mar(c,4)=B(w,7);
       mar(c,5)=B(w,8);
       mar(c,6)=B(w,9);
       c=c+1;
   elseif B(w,2)==4
       apr(d,1)=B(w,4);
       apr(d,2)=B(w,5);
       apr(d,3)=B(w,6);
       apr(d,4)=B(w,7);
       apr(d,5)=B(w,8);
       apr(d,6)=B(w,9);
       d=d+1;
   elseif B(w,2)==5
       may(e,1)=B(w,4);
       may(e,2)=B(w,5);
       may(e,3)=B(w,6);
       may(e,4)=B(w,7);
       may(e,5)=B(w,8);
       may(e,6)=B(w,9);
       e=e+1;
   elseif B(w,2)==6
       jun(f,1)=B(w,4);
       jun(f,2)=B(w,5);
       jun(f,3)=B(w,6);
       jun(f,4)=B(w,7);
       jun(f,5)=B(w,8);
       jun(f,6)=B(w,9);
       f=f+1;
   elseif B(w,2)==7
       jul(g,1)=B(w,4);
       jul(g,2)=B(w,5);
       jul(g,3)=B(w,6);
       jul(g,4)=B(w,7);
       jul(g,5)=B(w,8);
       jul(g,6)=B(w,9);
       g=g+1;
   elseif B(w,2)==8
       aug(h,1)=B(w,4);
       aug(h,2)=B(w,5);
       aug(h,3)=B(w,6);
       aug(h,4)=B(w,7);
       aug(h,5)=B(w,8);
       aug(h,6)=B(w,9);
       h=h+1;
   elseif B(w,2)==9
       sep(i,1)=B(w,4);
       sep(i,2)=B(w,5);
       sep(i,3)=B(w,6);
       sep(i,4)=B(w,7);
       sep(i,5)=B(w,8);
       sep(i,6)=B(w,9);
       i=i+1;
   elseif B(w,2)==10
       oct(j,1)=B(w,4);
       oct(j,2)=B(w,5);
       oct(j,3)=B(w,6);
       oct(j,4)=B(w,7);
       oct(j,5)=B(w,8);
       oct(j,6)=B(w,9);
       j=j+1;
   elseif B(w,2)==11
       nov(k,1)=B(w,4);
       nov(k,2)=B(w,5);
       nov(k,3)=B(w,6);
       nov(k,4)=B(w,7);
       nov(k,5)=B(w,8);
       nov(k,6)=B(w,9);
       k=k+1;
   elseif B(w,2)==12
       dec(l,1)=B(w,4);
       dec(l,2)=B(w,5);
       dec(l,3)=B(w,6);
       dec(l,4)=B(w,7);
       dec(l,5)=B(w,8);
       dec(l,6)=B(w,9);
       l=l+1;  
   end
end

year=zeros(26,1);
for i=1:27
    year(i,1)=1990+i-1;
end

year1=zeros(25,1);
for i=1:26
    year1(i,1)=1990+i-1;
end

year2=zeros(26,1);
for i=1:26
    year2(i,1)=1991+i-1;
end

year3=zeros(25,1);
for i=1:25
    year3(i,1)=1991+i-1;
end

jan=[year2 jan]; feb=[year2 feb]; mar=[year2 mar]; apr=[year2 apr]; may=[year2 may];
jun=[year3 jun]; jul=[year3 jul]; aug=[year3 aug]; sep=[year3 sep]; oct=[year3 oct];
nov=[year1 nov]; dec=[year1 dec];

fileid=fopen('/home/irida/Desktop/months/jan.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',jan(i,1),jan(i,2),jan(i,3),jan(i,4),jan(i,5),jan(i,6),jan(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/feb.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',feb(i,1),feb(i,2),feb(i,3),feb(i,4),feb(i,5),feb(i,6),feb(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/mar.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',mar(i,1),mar(i,2),mar(i,3),mar(i,4),mar(i,5),mar(i,6),mar(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/apr.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',apr(i,1),apr(i,2),apr(i,3),apr(i,4),apr(i,5),apr(i,6),apr(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/may.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',may(i,1),may(i,2),may(i,3),may(i,4),may(i,5),may(i,6),may(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/jun.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:25
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',jun(i,1),jun(i,2),jun(i,3),jun(i,4),jun(i,5),jun(i,6),jun(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/jul.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:25
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',jul(i,1),jul(i,2),jul(i,3),jul(i,4),jul(i,5),jul(i,6),jul(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/aug.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:25
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',aug(i,1),aug(i,2),aug(i,3),aug(i,4),aug(i,5),aug(i,6),aug(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/sep.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:25
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',sep(i,1),sep(i,2),sep(i,3),sep(i,4),sep(i,5),sep(i,6),sep(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/oct.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:25
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',oct(i,1),oct(i,2),oct(i,3),oct(i,4),oct(i,5),oct(i,6),oct(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/nov.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',nov(i,1),nov(i,2),nov(i,3),nov(i,4),nov(i,5),nov(i,6),nov(i,7));
end
fclose(fileid);


fileid=fopen('/home/irida/Desktop/months/dec.txt', 'w');
fprintf(fileid,'\t%4s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','T1','T2','T3','O1','O2','O3');

for i=1:26
  fprintf(fileid,'\t%4.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',dec(i,1),dec(i,2),dec(i,3),dec(i,4),dec(i,5),dec(i,6),dec(i,7));
end
fclose(fileid);
