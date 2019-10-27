
fid=fopen('/home/irida/Desktop/Σχολή/8ο Εξάμηνο/Πτυχιακή/final1.txt','r');
C=textscan(fid,'%4.0f %5.0f %3.0f %10.3f %10.3f %10.3f %10.1f %10.1f %10.1f\n',1636,'headerlines',1);
fclose(fid);
B=horzcat(C{:});

T1=zeros(307,1); T2=zeros(307,1); T3=zeros(307,1); O1=zeros(307,1); O2=zeros(307,1); O3=zeros(307,1);
yr=zeros(307,1); year=zeros(307,1); month=zeros(307,1);
arxi=1;
telos=arxi;
j=0;
for i=1:1635
      if B(i,2)==B(i+1,2)
         telos=telos+1;
      else
         j=j+1;
         T1(j,1)=nanmean(B(arxi:telos,4));
         T2(j,1)=nanmean(B(arxi:telos,5));
         T3(j,1)=nanmean(B(arxi:telos,6));
         O1(j,1)=nanmean(B(arxi:telos,7));
         O2(j,1)=nanmean(B(arxi:telos,8));
         O3(j,1)=nanmean(B(arxi:telos,9));
         yr(j,1)=B(i,1)+(B(i,2)-1)/B(i,2);
         year(j,1)=B(i,1);
         month(j,1)=B(i,2);
         arxi=telos+1;
         telos=arxi;       
      end
end
j=j+1;
T1(j,1)=nanmean(B(arxi:telos,4));
T2(j,1)=nanmean(B(arxi:telos,5));
T3(j,1)=nanmean(B(arxi:telos,6));
O1(j,1)=nanmean(B(arxi:telos,7));
O2(j,1)=nanmean(B(arxi:telos,8));
O3(j,1)=nanmean(B(arxi:telos,9));
yr(j,1)=B(i,1)+(B(i,2)-1)/B(i,2);
year(j,1)=B(i,1);
month(j,1)=B(i,2);

final2=[year month yr T1 T2 T3 O1 O2 O3 ];
fileid=fopen('/home/irida/Desktop/Σχολή/8ο Εξάμηνο/Πτυχιακή/final2.txt', 'w');
fprintf(fileid,'\t%4s\t%5s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','month','dyear','T1','T2','T3','O1','O2','O3');
for i=1:307
fprintf(fileid,'\t%4.0f\t%5.0f\t%10.3f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',final2(i,1),final2(i,2),final2(i,3),final2(i,4),final2(i,5),final2(i,6),final2(i,7),final2(i,8),final2(i,9));
end
fclose(fileid);

% plot(yr,T1); plot(yr,T2); plot(yr,T3); plot(yr,O1); plot(yr,O2); plot(yr(~isnan(O3)),O3(~isnan(O3)));
% plot(month,T1);plot(month,T2);plot(month,T3);plot(month,O1);plot(month,O2);plot(month(~isnan(O3)),O3(~isnan(O3)));
