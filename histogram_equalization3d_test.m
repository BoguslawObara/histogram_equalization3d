%% clear
clc; clear all; close all;

%% path
addpath('./lib')
addpath('../vesselness3d/lib')

%% load image
im = imread3d('./im/macular_hole.tif');

%% normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));

%% 3d histogram equalization
imh = histogram_equalization3d(im,255);

%% plot
z = 30;
figure; imagesc(im(:,:,z)); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

figure; imagesc(imh(:,:,z)); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;