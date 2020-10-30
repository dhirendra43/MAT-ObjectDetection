clc ;clear;close all;
SceneImage=imread('scene.png');
TargetImage=imread('crop.bmp');
SceneImage=rgb2gray(SceneImage);
TargetImage=rgb2gray(TargetImage);
ScenePoints=detectSURFFeatures(SceneImage);
TargetPoints=detectSURFFeatures(TargetImage);
[SceneFeatures,ScenevalidPoints]=extractFeatures(SceneImage,ScenePoints);
[TargetFeatures,TargetvalidPoints]=extractFeatures(TargetImage,TargetPoints);
indexParis=matchFeatures(SceneFeatures,TargetFeatures);
matchpoints1=ScenevalidPoints(indexParis(:,1));
matchpoints2=TargetvalidPoints(indexParis(:,2));
figure;
showMatchedFeatures(SceneImage,TargetImage,matchpoints1,matchpoints2,'montage')


