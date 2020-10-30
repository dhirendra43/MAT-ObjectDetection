function [matchpoints1,matchpoints2] = featureextraction(SceneImage,TargetImage)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
ScenePoints=detectSURFFeatures(SceneImage);
TargetPoints=detectSURFFeatures(TargetImage);
[SceneFeatures,ScenevalidPoints]=extractFeatures(SceneImage,ScenePoints);
[TargetFeatures,TargetvalidPoints]=extractFeatures(TargetImage,TargetPoints);
indexParis=matchFeatures(SceneFeatures,TargetFeatures);
matchpoints1=ScenevalidPoints(indexParis(:,1));
matchpoints2=TargetvalidPoints(indexParis(:,2));
end

