clear all
clc
x=dlmread('accels2.txt');
zpad=nextpow2(length(x));
x=[x;zeros(2^zpad-length(x),1)];
N=length(x);
X=fft(x);
mag(1)=abs(X(1))/N;
mag(N/2+1)=abs(X(N/2+1))/N;
mag(2:N/2)=2*abs(X(2:N/2))/N;
freqs=linspace(0,1,N/2+1);

figure(1)
plot(x(201:300))
title('unfiltered accels');
xlabel('sample');

figure(2)
stem(freqs,mag)
title('unfiltered FFT')
axis([-0.05 1.05 -0.1*max(mag) max(mag)+0.1*max(mag)]);

x_maf=dlmread('accelsMAF.txt');
zpad=nextpow2(length(x_maf));
x_maf=[x_maf;zeros(2^zpad-length(x_maf),1)];
N=length(x_maf);
X_maf=fft(x_maf);
mag(1)=abs(X_maf(1))/N;
mag(N/2+1)=abs(X_maf(N/2+1))/N;
mag(2:N/2)=2*abs(X_maf(2:N/2))/N;
freqs=linspace(0,1,N/2+1);

figure(3)
plot(x_maf(201:300))
title('MAF accels');
xlabel('sample');

figure(4)
stem(freqs,mag)
title('MAF FFT')
axis([-0.05 1.05 -0.1*max(mag) max(mag)+0.1*max(mag)]);

x_fir=dlmread('accelsFIR.txt');
zpad=nextpow2(length(x_fir));
x_fir=[x_fir;zeros(2^zpad-length(x_fir),1)];
N=length(x_fir);
X_fir=fft(x_fir);
mag(1)=abs(X_fir(1))/N;
mag(N/2+1)=abs(X_fir(N/2+1))/N;
mag(2:N/2)=2*abs(X_fir(2:N/2))/N;
freqs=linspace(0,1,N/2+1);

figure(5)
plot(x_fir(201:300))
title('FIR accels');
xlabel('sample');

figure(6)
stem(freqs,mag)
title('FIR FFT')
axis([-0.05 1.05 -0.1*max(mag) max(mag)+0.1*max(mag)]);

