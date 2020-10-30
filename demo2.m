clc ;clear;close all;
camObj = webcam;

TargetImage=imread('target1.jpg');

TargetImage=rgb2gray(TargetImage);
while(1)
    SceneImage1=snapshot(camObj);
    SceneImage=rgb2gray(SceneImage1);
    [matchpoints1,matchpoints2]=featureextraction(SceneImage,TargetImage)
    len=length(matchpoints1);
    if len>20
        disp('Object Detected');
       
        boxPolygon = [1, 1;...                           % top-left
                size(TargetImage, 2), 1;...                 % top-right
                size(TargetImage, 2), size(TargetImage, 1);... % bottom-right
                1, size(TargetImage, 1);...                 % bottom-left
                1, 1];  
             [tform, inlierBoxPoints, inlierScenePoints] = ...
            estimateGeometricTransform(matchpoints2, matchpoints1, 'affine');
         newBoxPolygon = transformPointsForward(tform, boxPolygon);
      
        d='Object Recognized'
        currFrame=SceneImage1;
        position = [321 430];    
        box_color = {'yellow'};
        RGB = insertText(currFrame,position,d,'FontSize',22,'BoxColor', box_color,'BoxOpacity',0.9);
        imshow(RGB);
        hold on;
        line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
        title('Detected Box');
% top-left again to close the polygon

            
    else
       disp('Object not Detected');
       d='Object Not Recognized'
        currFrame=SceneImage1;
        position = [321 430];    
        box_color = {'red'};
        RGB = insertText(currFrame,position,d,'FontSize',22,'BoxColor', box_color,'BoxOpacity',0.9);
        imshow(RGB);

    end
end
