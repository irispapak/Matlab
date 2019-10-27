yr=zeros(1636,1); day=zeros(1636,1); month=zeros(1636,1);
T1=zeros(1636,1); T2=zeros(1636,1); T3=zeros(1636,1);
O1=zeros(1636,1); O2=zeros(1636,1); O3=zeros(1636,1); 
metr1=zeros(1636,1); metr2=zeros(1636,1); metr3=zeros(1636,1); 

files=dir(['/home/irida/Desktop/Σχολή/8ο Εξάμηνο/Πτυχιακή/ozonesondes/' '*.txt']);     

for fl=1:length(files)
    
    [A,~,~,~,~,~] = txt2mat(files(fl).name);  
    yr(fl,1)=str2double(files(fl).name(1,7:10));
    month(fl,1)=str2double(files(fl).name(1,12:13));
    day(fl,1)=str2double(files(fl).name(1,15:16));
    
%     yr=[yr; str2num(files(fl).name(1,7:10))];                                        
%     month=[month; str2num(files(fl).name(1,12:13))];                                      
%     day=[day; str2num(files(fl).name(1,15:16))];                                          
    
    tnan1=0; tnan2=0; tnan3=0;
    
    if size(A,1)>223
        for j=73:123
            if A(j,5)>900
                A(j,5)=nan;
                tnan1=tnan1+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        for j=124:173
            if A(j,5)>900
                A(j,5)=nan;
                tnan2=tnan2+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        for j=174:223
            if A(j,5)>900
                A(j,5)=nan;
                tnan3=tnan3+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        
        metr1(fl,1)=50-tnan1; metr2(fl,1)=50-tnan2; metr3(fl,1)=50-tnan3;
%         metr1=[metr1; 50-tnan1];metr2=[metr2; 50-tnan2];metr3=[metr3; 50-tnan3];

    elseif size(A,1)<=223 && size(A,1)>=174
        for j=73:123
            if A(j,5)>900
                A(j,5)=nan;
                tnan1=tnan1+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        for j=124:173
            if A(j,5)>900
                A(j,5)=nan;
                tnan2=tnan2+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        for j=174:size(A,1)
            if A(j,5)>900
                A(j,5)=nan;
                tnan3=tnan3+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        
        metr1(fl,1)=50-tnan1; metr2(fl,1)=50-tnan2; metr3(fl,1)=size(A,1)-173-tnan3;
%         metr1=[metr1; 50-tnan1];metr2=[metr2; 50-tnan2];metr3=[metr3; size(A,1)-173-tnan3];

    elseif size(A,1)<=173 && size(A,1)>=124
        for j=73:123
            if A(j,5)>900
                A(j,5)=nan;
                tnan1=tnan1+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        for j=124:size(A,1)
            if A(j,5)>900
                A(j,5)=nan;
                tnan2=tnan2+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        
        metr1(fl,1)=50-tnan1; metr2(fl,1)=size(A,1)-123-tnan2; metr3(fl,1)=0;
%         metr1=[metr1; 50-tnan1];metr2=[metr2; size(A,1)-123-tnan2];metr3=[metr3; 0];

    elseif size(A,1)<=123 && size(A,1)>=74
        for j=73:size(A,1)
            if A(j,5)>900
                A(j,5)=nan;
                tnan1=tnan1+1;
            end
            if A(j,10)>90
                A(j,10)=nan;
            end
        end
        
        metr1(fl,1)=size(A,1)-73-tnan1; metr2(fl,1)=0; metr3(fl,1)=0;
%         metr1=[metr1; size(A,1)-73-tnan1];metr2=[metr2; 0];metr3=[metr3; 0];
    
    else
        metr1(fl,1)=0; metr2(fl,1)=0; metr3(fl,1)=0;
%         metr1=[metr1; 0];metr2=[metr2; 0];metr3=[metr3; 0];
    end
    
    if size(A,1)>223
        if metr1(fl,1)>=25
            T1(fl,1)=nanmean(A(74:123,5));
%             T1=[T1; nanmean(A(74:123,5))];
        else
            T1(fl,1)=nan;
%             T1=[T1; nan];
        end
        if metr2(fl,1)>=25
            T2(fl,1)=nanmean(A(124:173,5));
%             T2=[T2; nanmean(A(124:173,5))];
        else
            T2(fl,1)=nan;
%             T2=[T2; nan];
        end
        if metr3(fl,1)>=25
            T3(fl,1)=nanmean(A(174:223,5));
%             T3=[T3; nanmean(A(174:223,5))];
        else
            T3(fl,1)=nan;
%             T3=[T3; nan];
        end
        
        if isnan(A(74,10)) && isnan(A(123,10))
            if isnan(A(73,10)) 
                O1(fl,1)=nan;
%                 O1=[O1; nan];
            else 
                if isnan(A(122,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(122,10)-A(73,10))*1000;
%                     O1=[O1; (A(122,10)-A(73,10))*1000];
                end
            end
        else
            if isnan(A(74,10))
                if isnan(A(73,10))
                    O1(fl,1)=nan;
%                    O1=[O1; nan];
                else
                    O1(fl,1)=(A(123,10)-A(73,10))*1000;
%                     O1=[O1; (A(123,10)-A(73,10))*1000];
                end
            elseif isnan(A(123,10))
                    if isnan(A(122,10))
                        O1(fl,1)=nan;
%                         O1=[O1; nan];
                    else
                        O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                         O1=[O1; (A(122,10)-A(74,10))*1000];
                    end
            else
                O1(fl,1)=(A(123,10)-A(74,10))*1000;
%                 O1=[O1; (A(123,10)-A(74,10))*1000];
            end
        end
        
       if isnan(A(124,10)) && isnan(A(173,10))
            if isnan(A(123,10)) 
                O2(fl,1)=nan;
%                 O2=[O2; nan];
            else 
                if isnan(A(172,10))
                    O2(fl,1)=nan;
%                     O2=[O2; nan];
                else
                    O2(fl,1)=(A(172,10)-A(123,10))*1000;
%                     O2=[O2; (A(172,10)-A(123,10))*1000];
                end
            end
        else
            if isnan(A(124,10))
                if isnan(A(123,10))
                  O2(fl,1)=nan;
%                   O2=[O2; nan];
                else
                    O2(fl,1)=(A(173,10)-A(123,10))*1000;
%                     O2=[O2; (A(173,10)-A(123,10))*1000];
                end
            elseif isnan(A(173,10))
                    if isnan(A(172,10))
                        O2(fl,1)=nan;
%                         O2=[O2; nan];
                    else
                        O2(fl,1)=(A(172,10)-A(124,10))*1000;
%                         O2=[O2; (A(172,10)-A(124,10))*1000];
                    end
            else
                O2(fl,1)=(A(173,10)-A(124,10))*1000;
%                 O2=[O2; (A(173,10)-A(124,10))*1000];
            end
       end
       
       if isnan(A(174,10)) && isnan(A(223,10))
            if isnan(A(173,10)) 
                O3(fl,1)=nan;
%                 O3=[O3; nan];
            else 
                if isnan(A(222,10))
                    O3(fl,1)=nan;
%                     O3=[O3; nan];
                else
                    O3(fl,1)=(A(222,10)-A(173,10))*1000;
%                     O3=[O3; (A(222,10)-A(173,10))*1000];
                end
            end
        else
            if isnan(A(174,10))
                if isnan(A(173,10))
                   O3(fl,1)=nan;
%                     O3=[O3; nan];
                else
                    O3(fl,1)=(A(223,10)-A(173,10))*1000;
%                     O3=[O3; (A(223,10)-A(173,10))*1000];
                end
            elseif isnan(A(223,10))
                    if isnan(A(222,10))
                        O3(fl,1)=nan;
%                         O3=[O3; nan];
                    else
                        O3(fl,1)=(A(222,10)-A(174,10))*1000;
%                         O3=[O3; (A(222,10)-A(174,10))*1000];
                    end
            else
                O3(fl,1)=(A(223,10)-A(174,10))*1000;
%                 O3=[O3; (A(223,10)-A(174,10))*1000];
            end
       end
        
    elseif size(A,1)<=223 && size(A,1)>=174
        if metr1(fl,1)>=25
            T1(fl,1)=nanmean(A(74:123,5));
%             T1=[T1; nanmean(A(74:123,5))];
        else
            T1(fl,1)=nan;
%             T1=[T1; nan];
        end
        if metr2(fl,1)>=25
            T2(fl,1)=nanmean(A(124:173,5));
%             T2=[T2; nanmean(A(124:173,5))];
        else
            T2(fl,1)=nan;
%             T2=[T2; nan];
        end
        if metr3(fl,1)>=25
            T3(fl,1)=nanmean(A(174:size(A,1),5));
%             T3=[T3; nanmean(A(174:size(A,1),5))];
        else
            T3(fl,1)=nan;
%             T3=[T3; nan];
        end
        
        if isnan(A(74,10)) && isnan(A(123,10))
            if isnan(A(73,10)) 
                O1(fl,1)=nan;
%                 O1=[O1; nan];
            else 
                if isnan(A(122,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(122,10)-A(73,10))*1000;
%                     O1=[O1; (A(122,10)-A(73,10))*1000];
                end
            end
        else
            if isnan(A(74,10))
                if isnan(A(73,10))
                  O1(fl,1)=nan; 
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(123,10)-A(73,10))*1000;
%                     O1=[O1; (A(123,10)-A(73,10))*1000];
                end
            elseif isnan(A(123,10))
                    if isnan(A(122,10))
                        O1(fl,1)=nan;
%                         O1=[O1; nan];
                    else
                        O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                         O1=[O1; (A(122,10)-A(74,10))*1000];
                    end
            else
                O1(fl,1)=(A(123,10)-A(74,10))*1000;
%                 O1=[O1; (A(123,10)-A(74,10))*1000];
            end
        end
        
        if isnan(A(124,10)) && isnan(A(173,10))
            if isnan(A(123,10)) 
                O2(fl,1)=nan;
%                 O2=[O2; nan];
            else 
                if isnan(A(172,10))
                    O2(fl,1)=nan;
%                     O2=[O2; nan];
                else
                    O2(fl,1)=(A(172,10)-A(123,10))*1000;
%                     O2=[O2; (A(172,10)-A(123,10))*1000];
                end
            end
        else
            if isnan(A(124,10))
                if isnan(A(123,10))
                   O2(fl,1)=nan;
%                    O2=[O2; nan];
                else
                    O2(fl,1)=(A(173,10)-A(123,10))*1000;
%                     O2=[O2; (A(173,10)-A(123,10))*1000];
                end
            elseif isnan(A(173,10))
                    if isnan(A(172,10))
                        O2(fl,1)=nan;
%                         O2=[O2; nan];
                    else
                        O2(fl,1)=(A(172,10)-A(124,10))*1000;
%                         O2=[O2; (A(172,10)-A(124,10))*1000];
                    end
            else
                O2(fl,1)=(A(173,10)-A(124,10))*1000;
%                 O2=[O2; (A(173,10)-A(124,10))*1000];
            end
        end
             
       if size(A,1)==223 
           if isnan(A(174,10)) && isnan(A(223,10))
              if isnan(A(173,10)) 
                O3(fl,1)=nan;
%                   O3=[O3; nan];
              else 
                  if isnan(A(222,10))
                    O3(fl,1)=nan;
%                       O3=[O3; nan];
                  else
                      O3(fl,1)= (A(222,10)-A(173,10))*1000;
%                       O3=[O3; (A(222,10)-A(173,10))*1000];
                  end
              end
           else
              if isnan(A(174,10))
                  if isnan(A(173,10))
                    O3(fl,1)=nan;
%                       O3=[O3; nan];
                  else
                      O3(fl,1)=(A(223,10)-A(173,10))*1000;
%                       O3=[O3; (A(223,10)-A(173,10))*1000];
                  end
              elseif isnan(A(223,10))
                    if isnan(A(222,10))
                        O3(fl,1)=nan;
%                         O3=[O3; nan];
                    else
                        O3(fl,1)=(A(222,10)-A(174,10))*1000;
%                         O3=[O3; (A(222,10)-A(174,10))*1000];
                    end
              else
                  O3(fl,1)=(A(223,10)-A(174,10))*1000;
%                   O3=[O3; (A(223,10)-A(174,10))*1000];
              end
           end
       elseif size(A,1)==222
           if isnan(A(222,10)) && isnan(A(174,10))
               O3(fl,1)=nan;
%                O3=[O3; nan];
           else
               if isnan(A(174,10)) 
                   if isnan(A(173,10))
                      O3(fl,1)=nan;
%                        O3=[O3; nan];
                   else
                      O3(fl,1)=(A(222,10)-A(173,10))*1000;  
%                        O3=[O3; (A(222,10)-A(173,10))*1000];
                   end
               else
                   if isnan(A(222,10))
                       O3(fl,1)=nan;
%                        O3=[O3; nan];
                   else
                        O3(fl,1)=(A(222,10)-A(174,10))*1000;
%                        O3=[O3; (A(222,10)-A(174,10))*1000];
                   end
               end
           end               
       else
           O3(fl,1)=nan;
%            O3=[O3; nan];
       end    
           
    elseif size(A,1)<=173 && size(A,1)>=124
        if metr1(fl,1)>=25
            T1(fl,1)=nanmean(A(74:123,5));
%             T1=[T1; nanmean(A(74:123,5))];
        else
            T1(fl,1)=nan;
%             T1=[T1; nan];
        end
        if metr2(fl,1)>=25
            T2(fl,1)= nanmean(A(124:size(A,1),5));
%             T2=[T2; nanmean(A(124:size(A,1),5))];
        else
            T2(fl,1)=nan;
%             T2=[T2; nan];
        end
        T3(fl,1)=nan;
%         T3=[T3; nan];
        O3(fl,1)=nan;
%         O3=[O3; nan];

        if isnan(A(74,10)) && isnan(A(123,10))
              if isnan(A(73,10)) 
                 O1(fl,1)=nan;
%                 O1=[O1; nan];
              else
                  if isnan(A(122,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                  else
                   O1(fl,1)= (A(122,10)-A(73,10))*1000;
%                   O1=[O1; (A(122,10)-A(73,10))*1000];
                  end
              end
        else
            if isnan(A(74,10))
                if isnan(A(73,10))
                     O1(fl,1)=nan;
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(123,10)-A(73,10))*1000;
 %                     O1=[O1; (A(123,10)-A(73,10))*1000];
                end
            elseif isnan(A(123,10))
                if isnan(A(122,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                     O1=[O1; (A(122,10)-A(74,10))*1000];
                end
            else
                O1(fl,1)=(A(123,10)-A(74,10))*1000;
%                 O1=[O1; (A(123,10)-A(74,10))*1000];
            end
        end
       
        if size(A,1)==173
            if isnan(A(124,10)) && isnan(A(173,10))
              if isnan(A(123,10)) 
                  O2(fl,1)=nan;
%                   O2=[O2; nan];
              else 
                  if isnan(A(172,10))
                    O2(fl,1)=nan;
%                       O2=[O2; nan];
                  else
                      O2(fl,1)=(A(172,10)-A(123,10))*1000;
%                       O2=[O2; (A(172,10)-A(123,10))*1000];
                  end
              end
            else
              if isnan(A(124,10))
                  if isnan(A(123,10))
                   O2(fl,1)=nan;
%                       O2=[O2; nan];
                  else
                      O2(fl,1)=(A(173,10)-A(123,10))*1000;
%                       O2=[O2; (A(173,10)-A(123,10))*1000];
                  end
              elseif isnan(A(173,10))
                    if isnan(A(172,10))
                        O2(fl,1)=nan;
%                         O2=[O2; nan];
                    else
                        O2(fl,1)=(A(172,10)-A(124,10))*1000;
%                         O2=[O2; (A(172,10)-A(124,10))*1000];
                    end
              else
                  O2(fl,1)=(A(173,10)-A(124,10))*1000;
%                   O2=[O2; (A(173,10)-A(124,10))*1000];
              end
            end
        elseif size(A,1)==172
            if isnan(A(172,10)) && isnan(A(124,10))
                O2(fl,1)=nan;
%                 O2=[O2; nan];
            else
                if isnan(A(124,10))
                   if isnan(A(123,10))
                       O2(fl,1)=nan;
%                        O2=[O2; nan];
                   else
                       O2(fl,1)=(A(172,10)-A(123,10))*1000;
%                        O2=[O2; (A(172,10)-A(123,10))*1000];
                   end
                elseif isnan(A(172,10))
                   O2(fl,1)=nan;
%                     O2=[O2; nan];
                else
                    O2(fl,1)=(A(172,10)-A(124,10))*1000;
%                     O2=[O2; (A(172,10)-A(124,10))*1000];
                end
            end        
        else
            O2(fl,1)=nan;
%             O2=[O2; nan];
        end
  
    elseif size(A,1)<=123 && size(A,1)>=74
        if metr1(fl,1)>=25
            T1(fl,1)=nanmean(A(74:size(A,1),5));
%             T1=[T1; nanmean(A(74:size(A,1),5))];
        else
            T1(fl,1)=nan;
%             T1=[T1; nan];
        end
        T2(fl,1)=nan;
%         T2=[T2; nan];
        T3(fl,1)=nan;
%         T3=[T3; nan];   
        O2(fl,1)=nan;
        O3(fl,1)=nan;
%         O3=[O3; nan];
%         O2=[O2; nan];
        
        if size(A,1)==123
            if isnan(A(74,10)) && isnan(A(123,10))
               if isnan(A(73,10)) 
                  O1(fl,1)=nan;
%                    O1=[O1; nan];
               else 
                  if isnan(A(122,10))
                    O1(fl,1)=nan;
%                       O1=[O1; nan];
                  else
                      O1(fl,1)= (A(122,10)-A(73,10))*1000;
%                       O1=[O1; (A(122,10)-A(73,10))*1000];
                  end
               end
            else
              if isnan(A(74,10))
                  if isnan(A(73,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                  else
                    O1(fl,1)=(A(123,10)-A(73,10))*1000;    
%                    O1=[O1; (A(123,10)-A(73,10))*1000]; 
                  end
              elseif isnan(A(123,10))
                    if isnan(A(122,10))
                        O1(fl,1)=nan;
%                         O1=[O1; nan];
                    else
                        O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                         O1=[O1; (A(122,10)-A(74,10))*1000];
                    end
              else
                   O1(fl,1)=(A(123,10)-A(74,10))*1000;
%                 O1=[O1; (A(123,10)-A(74,10))*1000];
              end
            end
        elseif size(A,1)==122
            if isnan(A(122,10)) && isnan(A(74,10))
               O1(fl,1)=nan;
%                 O1=[O1; nan]; 
            else
                if isnan(A(122,10))
                    O1(fl,1)=nan;
%                     O1=[O1; nan];
                else
                    O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                     O1=[O1; (A(122,10)-A(74,10))*1000];
                end
                if isnan(A(74,10))
                    if isnan(A(73,10))
                        O1(fl,1)=nan;
%                         O1=[O1; nan];
                    else
                        O1(fl,1)=(A(122,10)-A(73,10))*1000;
%                         O1=[O1; (A(122,10)-A(73,10))*1000];
                    end
                else
                    O1(fl,1)=(A(122,10)-A(74,10))*1000;
%                     O1=[O1; (A(122,10)-A(74,10))*1000];
                end
            end    
        else
            O1(fl,1)=nan;
%             O1=[O1; nan];
        end
        
        
    else
         T1(fl,1)=nan;
%         T1=[T1; nan];
         T2(fl,1)=nan;
%         T2=[T2; nan];
         T3(fl,1)=nan;
%         T3=[T3; nan];
         O1(fl,1)=nan;
%         O1=[O1; nan];
         O2(fl,1)=nan;      
%         O2=[O2; nan];
         O3(fl,1)=nan;
%         O3=[O3; nan];
    end
 end

final1=[yr month day T1 T2 T3 O1 O2 O3];

fileid=fopen('/home/irida/Desktop/Σχολή/8ο Εξάμηνο/Πτυχιακή/final1.txt', 'w');
fprintf(fileid,'\t%4s\t%5s\t%3s\t%10s\t%10s\t%10s\t%10s\t%10s\t%10s\n','year','month','day','T1','T2','T3','O1','O2','O3');
for i=1:1636
fprintf(fileid,'\t%4.0f\t%5.0f\t%3.0f\t%10.3f\t%10.3f\t%10.3f\t%10.1f\t%10.1f\t%10.1f\n',final1(i,1),final1(i,2),final1(i,3),final1(i,4),final1(i,5),final1(i,6),final1(i,7),final1(i,8),final1(i,9));
end
fclose(fileid);
