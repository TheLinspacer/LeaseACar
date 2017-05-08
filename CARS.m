%Get monthly payments for car.
clear
clc
close all

Price = 18000:1000:21000;
Residual = 13000:50:16000;
mf = .0003:.00001:.002;

Term = 24;

[MF,RS] = meshgrid(mf,Residual);

Monthly = @(Dep,Fin,Tm) (Dep+Fin)/Tm;

Depr = @(P,R) P - R;

Finan = @(mfac,Pr,Re,Tm) mfac.*Tm.*(Re+Pr);

for k = 1:length(Price)
    Pmt = Monthly(Depr(Price(k),RS),Finan(MF,Price(k),RS,Term),Term);
    figure(1)
    subplot(2,2,k)
    contour(MF,RS,Pmt,[140:20:240 245 260:20:360],'showtext','on')
    xlabel('MoneyFactor')
    ylabel('Residual')
    title(sprintf('Shows monthly payment: The price is %.f',Price(k)))
    grid on
    fint = Finan(MF,Price(k),RS,Term);
    figure(2)
    subplot(2,2,k)
    contour(MF,RS,fint,'showtext','on')
    xlabel('MoneyFactor')
    ylabel('Residual')
    title(sprintf('Shows total finance charge: The price is %.f',Price(k)))
    grid on
    
end

%% Now set the terms at what was offered June 27th.
Terms = [24:12:60];
Resid = [15255 13424 11594 9560; 14848 13018 11187 9153]; 
MFac = .00051;
PriceAct = 20063;

figure
for k = 1:length(Terms)
    PmtLow = Monthly(Depr(PriceAct,Resid(1,k)),Finan(MFac,PriceAct,Resid(1,k),Terms(k)),Terms(k));
    fprintf('The Monthly Payment for %.d Months, residual $ %.d, is %.2f.\n',Terms(k),Resid(1,k),PmtLow)
    PmtStd = Monthly(Depr(PriceAct,Resid(2,k)),Finan(MFac,PriceAct,Resid(2,k),Terms(k)),Terms(k));
    hold on
    grid on
    plot(Terms(k),PmtLow,'.b','Markersize',20)
    plot(Terms(k),PmtStd,'.r','Markersize',20)
    xlabel('Lease Term Length (months)')
    ylabel('Monthly Payment ($)')
    title(sprintf('Monthly Payment from Given values\n MF = .00051   Price = $20063'))
end
legend('High Residual','Standard Residual')
    
    

