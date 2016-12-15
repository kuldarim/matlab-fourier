clc, clear, close all;
grayImage = imread('coins.png');
% Get the dimensions of the image.  numberOfColorBands should be = 1.
[rows columns numberOfColorBands] = size(grayImage);
% Display the original gray scale image.
subplot(1, 2, 1);
imshow(grayImage, []);
title('Original Grayscale Image');
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% Take the FFT.
% Zero out the corners
fftImage = fft2(grayImage);
window = 30;
fftImage(1:window, 1:window) = 0;
fftImage(end-window:end, 1:window) = 0;
fftImage(1:window, end-window:end) = 0;
fftImage(end-window:end, end-window:end) = 0;
% Display the filtered FFT image.
% Shift it and take log so we can see it easier.
% Inverse FFT to get high pass filtered image.
output = ifft2(fftImage);
% Display the output.
subplot(1, 2, 2);
imshow(real(output), []);
title('Filtered Image');