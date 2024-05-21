

sampling_rate = 1000; % 1kHz=1000Hz
F1 = 'data/data1.csv';
F2 = 'data/data2.csv';
F3 = 'data/data3.csv';
F4 = 'data/data4.csv';
F5 = 'data/data5.csv';

for f = 1:5
    % read csv file
    if f==1
        d = table2array(readtable(F1));
        % Time window
        tw_pre = 5 * sampling_rate;
        tw_pst = 30 * sampling_rate;
    elseif f==2
        d = table2array(readtable(F2));
        tw_pre = 10 * sampling_rate;
        tw_pst = 180 * sampling_rate;
    elseif f==3
        d = table2array(readtable(F3));
        tw_pre = 5 * sampling_rate;
        tw_pst = 30 * sampling_rate;
    elseif f==4
        d = table2array(readtable(F4));
        tw_pre = 5 * sampling_rate;
        tw_pst = 15 * sampling_rate;
    elseif f==5
        d = table2array(readtable(F5));
        tw_pre = 5 * sampling_rate;
        tw_pst = 15 * sampling_rate;
    end
    
    % Event
    BP = d(find(d(:,5)==1)-tw_pre:find(d(:,5)==1)+tw_pst,2);
    MP = d(find(d(:,5)==1)-tw_pre:find(d(:,5)==1)+tw_pst,3);
    HR = d(find(d(:,5)==1)-tw_pre:find(d(:,5)==1)+tw_pst,4);
    
    % plot
    figure(f); set(gcf,'position',[476 82 355 698]);
    % graph
    yl_BP = [50,200];
    yl_MP = [50,200];
    yl_HR = [300,500];
    subplot(3,1,1); hold on;
    plot([abs(tw_pre),abs(tw_pre)],yl_BP,'k-');
    plot(BP,'r-');
    ylim(yl_BP); ylabel('Blood pressure(mmHg)');
    set(gca,'xtick',0:5*sampling_rate:tw_pre+tw_pst,'XTickLabel',-tw_pre/sampling_rate:5:tw_pst/sampling_rate);
    subplot(3,1,2); hold on;
    plot([abs(tw_pre),abs(tw_pre)],yl_MP,'k-');
    plot(MP,'k-');
    ylim(yl_MP); ylabel('Mean Blood pressure(mmHg)');
    set(gca,'xtick',0:5*sampling_rate:tw_pre+tw_pst,'XTickLabel',-tw_pre/sampling_rate:5:tw_pst/sampling_rate);
    subplot(3,1,3); hold on;
    plot([abs(tw_pre),abs(tw_pre)],yl_HR,'k-');
    plot(HR,'g-');
    ylim(yl_HR); ylabel('Heart rate(bpm)');
    set(gca,'xtick',0:5*sampling_rate:tw_pre+tw_pst,'XTickLabel',-tw_pre/sampling_rate:5:tw_pst/sampling_rate);

    % save figure
    sfn = ['Fig_',num2str(f),'.pdf'];
    saveas(gcf,sfn);
end
