
T1 = 2; 
fs=1000;
t = 0:1/fs:T1;
f=10; 
x = sawtooth(2*pi*10*t);

n = 1024; 
Y = fft(x,n);
x2 = abs(Y/n);
x3 = x2(:,1:n/2+1);
x3(:,2:end-1) = 2*x3(:,2:end-1);

f03 = 10;  
T3 = 2;
fs3 = 1000;
t3 = 0:1/fs3:T3-1/fs3;   
x1 =  2/pi * ( (sin(2*pi*f03*t3)) - (1/2)*((sin(2*pi*2*f03*t3))) + (1/3)*((sin(2*pi*3*f03*t3))) - (1/4)*((sin(2*pi*4*f03*t3))) + (1/5)*((sin(2*pi*5*f03*t3))));

n = 1024; 
Y2 = fft(x1,n);
x4 = abs(Y2/n);
x5 = x4(:,1:n/2+1);
x5(:,2:end-1) = 2*x5(:,2:end-1);



subplot(2,2,1),plot(t,x);
xlim([0 2])
ylim([-1.10 1.10])
title('Sawtooth Wave');

subplot(2,2,2),plot(0:(fs/n):(fs/2-fs/n),x3(1:n/2));
xlim([0 200])
ylim([0 1])
title('Frequency Domain');

subplot(2,2,3),plot(t3,x1);
ylim([-1.10 1.10])
title('Sum of Sine Waves');
xlabel("time (s)");

subplot(2,2,4),plot(0:(fs/n):(fs/2-fs/n),x5(1:n/2));
xlim([0 200])
ylim([0 1])
title('Frequency Domain');
xlabel("frequency (Hz)");