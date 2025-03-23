function x=qrs_sub(sig)
assign=[];

       z=zeros(100,1);
       siginput=sig;
       inputsig=siginput(1,:);
       v1=siginput(1,:)-siginput(1,1);
       inputsig=v1;
       inputsig=inputsig';
       zero_cross=inputsig(1);
       inputsig=[z;inputsig;z];
              process_signal = inputsig;
              ls = length(process_signal);
       
fs=360;
N = length(process_signal);      % Length of the loaded sample
ti= (0:N-1)/fs;
%%%%%%%%%%%%%% Bandpass digital filter design %%%%%%%%%%%%%%%%%%%%%%
[b,a]=cheby1(6,1,[0.05,.25]);  % Bandpass digital filter design         
z = filter(b,a,process_signal);
dz = z-mean(z);
dz = dz/max(abs(dz));
an = abs(dz);
en = dz.^2;
sen = -an.*log(an);
sn = -en.*log(en);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  [c,l]=wavedec(process_signal,4,'db4');
  
  ca2=appcoef(c,l,'db4',2);
      base_corrected=ca2;
  y=base_corrected-zero_cross;
  figure;
  plot(y);
  title('tuned signal');
 smooth_signal=y;
m1=max(smooth_signal)-max(smooth_signal)*.60;
maxim=find(smooth_signal>=m1);
High_dat=maxim;
data_emp=[];
last=High_dat(1);
data_emp=[data_emp last];
for(i=2:1:length(High_dat))
    if(High_dat(i)>(last+10))
        last=High_dat(i);
        data_emp=[data_emp last];
    end
end
rpeak=smooth_signal(data_emp);
figure;
plot(smooth_signal),grid on,hold on
plot(data_emp,rpeak,'*');
rpeakdat=data_emp*4;
rwave_com=[];
for( i=1:1:length(rpeakdat))
    range= [rpeakdat(i)-20:rpeakdat(i)+20];
    m=max(inputsig(range));
    l=find(inputsig(range)==m);
    pos=range(l);
    rwave_com=[rwave_com pos];
end
rampp=inputsig(rwave_com);
figure;
plot(inputsig),grid on,hold on
plot(rwave_com,rampp,'*');
title('Detected R ')
Fref=rwave_com;
smooth_signal=inputsig;
for(i=1:1:1)
for(j=1:1:length(Fref))
    ref_datas=Fref(j)-100:Fref(j)-50;
    m=max(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    %%% ONSET
    fnd=0;
for k=ind-20:+1:ind
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind-20:+1:ind;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
rpeak_onset(i,j)=qpeak(1);
%fnd
for k=ind:+1:ind+20
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind:+1:ind+20;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
rpeak_ofset(i,j)=qpeak(1);
   try
        
    ref_datas=rwave_com(i,j)-100:rwave_com(i,j)-10;
    m=max(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    pwave_com(i,j)=ind;
    pampp(i,j)=m;
        
    end
    ref_datas=rwave_com(i,j)-50:rwave_com(i,j)-10;
    m=min(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    qwave_com(i,j)=ind;
    qampp(i,j)=m;
        fnd=0;
for k=ind-20:+1:ind
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind-20:+1:ind;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
qpeak_onset(i,j)=qpeak(1);
%fnd
for k=ind:+1:ind+20
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind:+1:ind+20;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
qpeak_ofset(i,j)=qpeak(1);
    
        ref_datas=rwave_com(i,j)+5:rwave_com(i,j)+50;
    m=min(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    swave_com(i,j)=ind;
    sampp(i,j)=m;
    %%%% onset off
    fnd=0;
for k=ind-5:+1:ind
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind-20:+1:ind;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
swave_onset(i,j)=qpeak(1);
fnd=0;
for k=ind:+1:ind+20
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind:+1:ind+20;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
swave_ofset(i,j)=qpeak(1);
    
    ref_datas=rwave_com(i,j)+25:rwave_com(i,j)+100;
    m=max(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    twave(i,j)=ind;
    tempa(i,j)=m;
        fnd=0;
for k=ind-20:+1:ind
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind-20:+1:ind;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
tpeak_onset(j,i)=qpeak(1);
fnd=0;
for k=ind:+1:ind+20
    if((smooth_signal(k)<=0) && (smooth_signal(k-1)>0))
        qpeak=k;
        fnd=1;
      break 
  end
end
if(fnd==0)
Qrange=ind:+1:ind+20;
qpeak=find(smooth_signal(Qrange)==max(smooth_signal(Qrange)));
qpeak=Qrange(qpeak);
end
tpeak_ofset(j,i)=qpeak(1);   

    if(tempa(i,j)<pampp(i,j))
        ref_datas=rwave_com(i,j)+25:rwave_com(i,j)+70;
    m=min(smooth_signal(ref_datas));
    ind=find(smooth_signal(ref_datas)==m);
    ind=ind(1);
    ind=ref_datas(ind);
    twave(i,j)=ind;
    tempa(i,j)=m;
    assign=[assign j];
    
    end
  end
end
figure;
k=1;
for(i=1:1:1)
      
    plot(smooth_signal), hold on;
    plot(rwave_com(i,:),rampp(i,:),'*b'),hold on;
    plot(qwave_com(i,:),qampp(i,:),'+k'),hold on;
    plot(swave_com(i,:),sampp(i,:),'or'),hold on;
    plot(pwave_com(i,:),pampp(i,:),'.g'), hold on
    plot(twave(i,:),tempa(i,:),'^m')
    grid on;
    k=k+1;
    if(k>6)
        k=1;
        figure;
    end
end


% clc;
% flag=0;
% if(length(assign)>ceil(.8*length(rwave_com)))
%     disp('MI Detected')
%     return;
% else
%     
%     flag=1;
% end
tpeak_ofset=tpeak_ofset';
tpeak_onset=tpeak_onset';
for(i=1:1:1)
   
 for(j=1:1:length(rwave_com(i,:))   )
rpoint(i,j)= ceil(rwave_com(i,j)-(swave_ofset(i,j)-qpeak_onset(i,j))/2);
tpoint(i,j)=ceil(twave(i,j)-(tpeak_ofset(i,j)-tpeak_onset(i,j))/2);
tdeviation(i,j)=abs(inputsig(rpoint(i,j),i)-inputsig(tpoint(i,j),i));
 end
end
x=tdeviation/100;
x=mean(x);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

