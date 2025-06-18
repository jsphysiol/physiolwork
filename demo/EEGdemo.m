% eegdemo

%% parameters
fs = 250; % fs = 1e3;
ft = [0.5,40]; % ft = [0.5,40];

%% data load
d = xlsread('20250618_EEGdata.xlsx');
d = d(2:end,:);

%% Bandpass Filter
% EEG_FL = d(:,2);
% EEG_FR = d(:,3);
% EEG_FZ = d(:,4);
% EEG_CZ = d(:,5);
% EEG_TL = d(:,6);
% EEG_TR = d(:,7);
% EEG_OL = d(:,8);
% EEG_OR = d(:,9);

Trig = d(:,14);
EEG_FL = bandpass(d(:,2),ft,fs);
EEG_FR = bandpass(d(:,3),ft,fs);
EEG_FZ = bandpass(d(:,4),ft,fs);
EEG_CZ = bandpass(d(:,5),ft,fs);
EEG_TL = bandpass(d(:,6),ft,fs);
EEG_TR = bandpass(d(:,7),ft,fs);
EEG_OL = bandpass(d(:,8),ft,fs);
EEG_OR = bandpass(d(:,9),ft,fs);

%%
xl = [10000,11000]; yl = [-50,50];
figure(1); set(gcf,'position',[476 43 451 818]);
subplot(9,1,1); hold on;
plot(Trig)
xlim(xl); ylim([0,1.1]);
subplot(9,1,2); hold on;
plot(EEG_FL)
xlim(xl); ylim(yl);
subplot(9,1,3); hold on;
plot(EEG_FR)
xlim(xl); ylim(yl);
subplot(9,1,4); hold on;
plot(EEG_FZ)
xlim(xl); ylim(yl);
subplot(9,1,5); hold on;
plot(EEG_CZ)
xlim(xl); ylim(yl);
subplot(9,1,6); hold on;
plot(EEG_TL)
xlim(xl); ylim(yl);
subplot(9,1,7); hold on;
plot(EEG_TR)
xlim(xl); ylim(yl);
subplot(9,1,8); hold on;
plot(EEG_OL)
xlim(xl); ylim(yl);
subplot(9,1,9); hold on;
plot(EEG_OR)
xlim(xl); ylim(yl);

%% Trigger range extraction
t = find(diff(Trig)==1);
anlwin = [-5,2.5]*250;
tTrig = [];
tEEG_FL = []; tEEG_FR = [];
tEEG_FZ = []; tEEG_CZ = [];
tEEG_TL = []; tEEG_TR = [];
tEEG_OL = []; tEEG_OR = [];
for tt = t'
    tTrig = [tTrig;Trig(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_FL = [tEEG_FL;EEG_FL(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_FR = [tEEG_FR;EEG_FR(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_FZ = [tEEG_FZ;EEG_FZ(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_CZ = [tEEG_CZ;EEG_CZ(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_TL = [tEEG_TL;EEG_TL(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_TR = [tEEG_TR;EEG_TR(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_OL = [tEEG_OL;EEG_OL(tt+anlwin(1):tt+anlwin(2))'];
    tEEG_OR = [tEEG_OR;EEG_OR(tt+anlwin(1):tt+anlwin(2))'];
end

%%
xl = [0,1850]; yl = [-20,20];
figure(2); set(gcf,'position',[476 43 451 818]);
subplot(9,1,1); hold on;
plot(nanmean(tTrig,1))
set(gca,'xtick',0:250:xl(2));
xlim(xl); ylim([0,1.1]);
subplot(9,1,2); hold on;
plot(nanmean(tEEG_FL,1))
xlim(xl); ylim(yl); % set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,3); hold on;
plot(nanmean(tEEG_FR,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,4); hold on;
plot(nanmean(tEEG_FZ,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,5); hold on;
plot(nanmean(tEEG_CZ,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,6); hold on;
plot(nanmean(tEEG_TL,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,7); hold on;
plot(nanmean(tEEG_TR,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,8); hold on;
plot(nanmean(tEEG_OL,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));
subplot(9,1,9); hold on;
plot(nanmean(tEEG_OR,1))
xlim(xl); ylim(yl); %set(gca,'yDir','reverse');
set(gca,'xtick',0:250:xl(2));

