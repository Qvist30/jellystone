close all
% for i=1:1
%   W0=.007;
%     C0=2.017;
%     E0=31.217
%     [x,y,u,dx]=trim('jellystone_v5')
%     disp(['Trial ', num2str(i), ':Equilibrium is ', num2str(x(1)), ' and ', num2str(x(2))]);
%     disp(['...']);
% end
figure
hold on
for i=1:25
    G0=.8+(rand-.5)*.16;
    W0=0;
    C0=2.017+(rand-.5)*.404;
    E0=31.217+(rand-.5)*6.244;
    plot([C0],[E0],'.r')
    xlabel('coyotes')
    ylabel('elk')
    title('coyotes vs. elk (no wolves)')
    [t,x,y]=sim('jellystone_v5');
    E=x(:,1);
    C=x(:,2);
    plot(C,E);
    if(E(end)<E0)
        disp(['Initial Wolf Count =',num2str(W0*1000), 'elk count=',num2str(E(end)*1000), 'coyote count=', num2str(C(end)*1000)]);
    end
end
% figure;
% plot(t,F);
% ylabel('fish');
% xlabel('time');
% title('Fish over time');
% figure;
% plot(t,S);
% ylabel('sharks');
% xlabel('time');
% title('Sharks over time');
% figure
% hold on
% for i=1:10  
%     F0=a/b+rand-rand;
%     S0=0;
%     plot([F0],[S0],'.r')
%     xlabel('fish')
%     ylabel('sharks')
%     title(['phase for ', num2str(a/b), ',0'])
%     [t,x,y]=sim('homework5_2');
%     F=x(:,1);
%     S=x(:,2);
%     plot(F,S)
% end
% figure
% hold on
% for i=1:10  
%     F0=(a*lam)/(b*lam+c*e)+rand-rand;
%     S0=(a*e)/(b*lam+c*e)+rand-rand;
%     plot([F0],[S0],'.r')
%     [t,x,y]=sim('homework5_2');
%     xlabel('fish')
%     ylabel('sharks')
%     title(['phase for ', num2str((a*lam)/(b*lam+c*e)), ',', num2str((a*e)/(b*lam+c*e))])
%     F=x(:,1);
%     S=x(:,2);
%     plot(F,S)
% end