% executeModel.m
% Written by Tom Kennedy and Matthew Ellis
% Executes the Jellystone_v6 model.

close all
acreage=19.68; % *1000
graze = .492;

figure
hold on
set_param('jellystone_v6', 'StopTime', '30')

initialWolfCount = 0;

%Shows Executes the simulation over 30 years without wolves, shows that
%the elk population is continuing to approach 40,000.  Uses random numbers 
% for G0 (grazing ground, which should be able to go from .72 to .88, for 
%C0 it can be 1,815 to 2,219, for E0 it can go from 25,873 to 37,461.
for i=1:25
    G0=.8+(rand-.5)*.16;
    W0=0;
    C0=2.017+(rand-.5)*.404;
    E0=31.217+(rand-.5)*6.244;
    plot([C0]*1000,[E0]*1000,'.r')
    xlabel('coyotes')
    ylabel('elk')
    title('coyotes vs. elk (no wolves)')
    [t,x,y]=sim('jellystone_v6');
    E=x(:,1);
    C=x(:,2);
    W=x(:,3);
    plot(C*1000,E*1000);
end

figure
hold on
%Determines what the number of wolves would be that we would need to
%introduce into the model for the elk population to decrease over 30 years.

for i=1:25
    G0=.8;
    W0=i/1000;
    C0=2.017;
    E0=31.217;
    plot([C0]*1000,[E0]*1000,'.r')
    xlabel('coyotes')
    ylabel('elk')
    title('coyotes vs. elk (with wolves)')
    [t,x,y]=sim('jellystone_v6');
    E=x(:,1);
    C=x(:,2);
    W=x(:,3);
    plot(C*1000,E*1000);
    disp(['Coyote percentage:',num2str(C(end)/C0),'Elk percentage:',num2str(E(end)/E0)]);
    if(E(end)<E0)
        initialWolfCount = W0;
        disp(['Initial Wolf Count =',num2str(W0*1000), 'elk count=',num2str(E(end)*1000), 'coyote count=', num2str(C(end)*1000)]);
        break
    end
end
figure
plot(W*1000,E*1000);
title(['Wolves vs. Elk with initial Wolf count of ', num2str(initialWolfCount*1000)]);
ylabel('elk');
xlabel('wolves');
figure
plot(t,W*1000);
title(['Wolves over time with initial wolf count of ', num2str(initialWolfCount*1000)]);
ylabel('wolves');
xlabel('time');

figure
plot(t,E*1000);
title(['Elk over time with initial wolf count of ', num2str(initialWolfCount*1000)]);
ylabel('elk');
xlabel('time');

figure
plot(t,C*1000);
title(['Coyotes over time with initial wolf count of ', num2str(initialWolfCount*1000)]);
ylabel('coyotes');
xlabel('time');

figure
hold on

%Plots using previously defined random numbers with the initial
%introduction wolf count.
for i=1:25
    G0=.8+(rand-.5)*.16;
    W0=initialWolfCount;
    C0=2.017+(rand-.5)*.404;
    E0=31.217+(rand-.5)*3.122;
    plot([C0]*1000,[E0]*1000,'.r')
    xlabel('coyotes')
    ylabel('elk')
    title(['coyotes vs. elk with initial wolf count of ', num2str(initialWolfCount*1000)])
    [t,x,y]=sim('jellystone_v6');
    E=x(:,1);
    C=x(:,2);
    W=x(:,3);
    plot(C*1000,E*1000);
end

%Executes the model over 100 years.
for i=1:1
    G0=.8;
    W0=initialWolfCount;
    C0=2.017;
    E0=31.217;

    set_param('jellystone_v6', 'StopTime', '100')
    [t,x,y]=sim('jellystone_v6');   
        E=x(:,1);
    C=x(:,2);
    W=x(:,3);
end
figure
plot(W*1000,E*1000);
title(['Wolves vs. Elk with initial Wolf count of ', num2str(initialWolfCount*1000), ' over a century']);
ylabel('elk');
xlabel('wolves');
figure
plot(t,W*1000);
title(['Wolves over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a century']);
ylabel('wolves');
xlabel('time');

figure
plot(t,E*1000);
title(['Elk over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a century']);
ylabel('elk');
xlabel('time');

figure
plot(t,C*1000);
title(['Coyotes over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a century']);
ylabel('coyotes');
xlabel('time');

%Executes the model over 1,000 years.  The coyotes go extinct :(
% Perhaps we should try to demonstrate that coyotes will go extinct anyway?
% or maybe they won't.
for i=1:1
    G0=.8;
    W0=initialWolfCount;
    C0=2.017;
    E0=31.217;
    set_param('jellystone_v6', 'StopTime', '1000')
    [t,x,y]=sim('jellystone_v6');   
    E=x(:,1);
    C=x(:,2);
    W=x(:,3);
    for j=1:size(C)
        if(C(j) < .001)
            disp(['After adding wolves, coytoes go extinct in year ', num2str(2016+j)]);
            break;
        end
    end
end
figure
plot(W*1000,E*1000);
title(['Wolves vs. Elk with initial Wolf count of ', num2str(initialWolfCount*1000), ' over a millenium']);
ylabel('elk');
xlabel('wolves');
figure
plot(t,W*1000);
title(['Wolves over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a millenium']);
ylabel('wolves');
xlabel('time');

figure
plot(t,E*1000);
title(['Elk over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a millenium']);
ylabel('elk');
xlabel('time');

figure
plot(t,C*1000);
title(['Coyotes over time with initial wolf count of ', num2str(initialWolfCount*1000), ' over a millenium']);
ylabel('coyotes');
xlabel('time');

figure;
hold on;

%Shows whether or not coyotes go extinct if we don't introduce any wolves.
for i=1:25
    G0=.8+(rand-.5)*.16;
    W0=0;
    C0=2.017+(rand-.5)*.404;
    E0=31.217+(rand-.5)*6.244;
    xlabel('time')
    ylabel('coyotes')
    title('coyotes vs. time (no wolves) over a millenium')
    [t,x,y]=sim('jellystone_v6');
    C=x(:,2);
    plot(t,C*1000);
    for j=1:size(C)
        if(C(j) < .001)
            averageExtinctionYear(i) = j+2016;
            break;
        end
    end
end
disp(['Without wolves, coyotes will go extinct around the year ', num2str(mean(averageExtinctionYear))]);
%Do we buy anything by introducing less wolves?
for i=1:1
    G0=.8;
    W0=.001;
    C0=2.017;
    E0=31.217;
    set_param('jellystone_v6', 'StopTime', '1000')
    [t,x,y]=sim('jellystone_v6');   
    E=x(:,1);
    C=x(:,2);
    W=x(:,3);
    for j=1:size(C)
        if(C(j) < .001)
            disp(['After adding only 1 wolf, coytoes go extinct in year ', num2str(2016+j)]);
            break;
        end
    end
end