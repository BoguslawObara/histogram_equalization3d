function imh = histogram_equalization3d(im,n)
%%  histogram_equalization3d - 3d histogram equalization
%   
%   REFERENCE:
%       A. Nasrulloh, C. Willcocks, P. T. Jackson, C. Geenen, M. S. Habib, 
%       D. H. Steel, and B. Obara, Multi-scale segmentation and surface 
%       fitting for measuring 3D macular holes, 
%       IEEE Transactions on Medical Imaging, 2017
%
%   INPUT:
%       im      - 3D gray image [0,1],
%       n       - number of bins,
%
%   OUTPUT:
%       imh     - enhanced image
%
%   AUTHOR:
%       Boguslaw Obara

%% histogram of the image
v = im(:);
b1 = min(v);
b2 = max(v);
h = histcounts(v,linspace(b1,b2,n+1));

%% divide the result by number of pixels
hn = h/numel(im);

%% cumlative sum
cs = cumsum(hn);

%% labels
[~,idx] = imquantize(im,linspace(0,1,n));

%% convert the cs into image
imh = cs(idx);

end