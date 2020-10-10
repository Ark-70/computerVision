%% Clean

close all, clear all, clc;

%% Static Param

IMG_PATH = 'image1.jpg';

%% init

img1 = imread(IMG_PATH);

%% Ginput

figure, imshow(img1);
% [rec2x, rec2y] = ginput(4);

rec2x = [2.825000000000000e+02;8.145000000000000e+02;3.658500000000000e+03;4.282500000000000e+03]
rec2y = [2.238500000000000e+03;2.345000000000000e+02;2.025000000000000e+02;2.218500000000000e+03]

h_ideal = 2970;
w_ideal = 2100;

H = construct_H(rec2x, rec2y, w_ideal, h_ideal);

% on se met dans le référenciel corrigé/idéal

H_inv = inv(H);
 
new_img_ideal = zeros(h_ideal, w_ideal, 3); % 3 canaux

for x=1:w_ideal
    for y=1:h_ideal
        
        newCoor = H_inv * [x y 1]';
       if(x==50 && y==50)
          img1(floor(newCoor(2)), floor(newCoor(1)), :) % j'ai des putains de coordonnées négatives
       end
        if(floor(newCoor(1))>1 && floor(newCoor(2))>1)
            new_img_ideal(y, x, :) = img1(floor(newCoor(2)), floor(newCoor(1)), :);

        end
        
    end
end

figure, imshow(new_img_ideal)
        