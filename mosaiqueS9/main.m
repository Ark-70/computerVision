%% Mosaique
close all; clc; clear all;

%% Charger les deux images

addpath(genpath('.')); % https://fr.mathworks.com/help/matlab/ref/addpath.html#btpdojp-1

im1_orig = imread('data/*-0.jpg');
im2_orig = imread('data/*-1.jpg');

im1 = rgb2gray(im1_orig);
im1 = single(im1);

im2 = rgb2gray(im2_orig);
im2 = single(im2);


[frame, desc] = vl_sift(im1);
% f sont les points caractéristiques/features et desc l'ensemble des 
% descripteurs des points caractéristiques


%% Plot descriptors on img
% https://www.vlfeat.org/overview/sift.html

imshow(im1_orig);
hold on;

% On choisit 20 points caractéristiques random dans tout le lot
perm = randperm(size(frame,2)) ; % random permutation
sel = perm(1:20) ; % selecteur

% On plot les cercles jaune + coutourés noir
h1 = vl_plotframe(frame(:,sel)) ;
h2 = vl_plotframe(frame(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

% Les cercles jaunes sont en fait un groupe de point dont on a observé
% l'orientation

% On plot les descripteurs qui forment les patchs jaunes
h3 = vl_plotsiftdescriptor(desc(:,sel),frame(:,sel)) ;
set(h3,'color','g') ;


[fb, db] = vl_sift(im2) ;
[matches, scores] = vl_ubcmatch(desc, db) ;

figure, plotmatches(double(im1_orig)/255, double(im2_orig)/255, frame, fb, matches);

constructMatchedFrame()

calculercoutH(H)

