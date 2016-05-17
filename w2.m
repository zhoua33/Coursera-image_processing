I = imread('test.gif');
whos I
I2 = im2double(I);
whos I2

I10 = double(I);
whos I10

I3= [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
whos I3

I5 = [1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25];

I4 = imfilter(I10, I3, 'replicate');
whos I4

I6= imfilter(I2, I5, 'replicate');

mse = sum((I2(:) - I4(:)).^2) / prod(size(I2));
mse2 = sum((I2(:) - I6(:)).^2) / prod(size(I2));

psnrnumber = 10*log10(1/mse);
psnr2 = 10*log10(255*255/mse2);

imse = immse(I2, I4);
which psnr
clear psnr
peaksnr2 = psnr(I10,I4,255);


imagesc(I2);colormap(gray);
Lo3x3=ones(3,3).*(1/9);
filtered1 = imfilter(I2,Lo3x3,'replicate');
MSE=sum( (I2(:) - filtered1(:)).^2 ) / numel(I2);
PSNR = 10*log10(255*255/MSE);
PSNRMD2 = 20*log10(255);
PSNRMD3 =  10*log10(MSE);
