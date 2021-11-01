clear ;
clc ;
close ;
pkg load image;
I1 = imread ('flower.jpg');  
I1 = imresize (I1 ,0.5) ;
[IndexedImage_I1,ColorMap]=rgb2ind(I1);
I = ColorMap ;
J1 = imread('watermark.jpg');
J1 = imresize (J1,0.5) ;
[IndexedImage_J1,ColorMap] = rgb2ind(J1);
#Similarity Matrix
J = ColorMap ;
[r,c]= size (I);
A = [];  
I = double (I);
J = double (J);
for i = 1:r
for j = 1:c
M1(i,j) = (I(i ,2).*sin(I(i ,1))-J(j ,2).*sin(J(j,1) ))^2;
M2(i,j) = (I(i ,2).*cos (I(i ,1))-J(j ,2).*cos(J(j,1) ))^2;
M3(i,j) = (I(i,3)-J(j,3))^2;
M(i,j)= sqrt(M1(i,j)+M2(i,j))+M3(i,j);
A(i,j) = 1-M(i,j)./sqrt (5) ;
end
end
I1_rec = ind2rgb( IndexedImage_I1 ,A)
I1_rec = imresize(I1_rec ,2) ;
J1_rec = ind2rgb( IndexedImage_J1 ,A)
J1_rec = imresize (J1_rec ,2) ;
imshow(I1 , 'originalfirst image');figure
imshow(I1_rec ,'Reconstructed first image');figure
imshow(J1 ,'original second image');figure
imshow( J1_rec ,' Reconstructed second image');figure
