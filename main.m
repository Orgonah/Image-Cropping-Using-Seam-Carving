clear; clc; close all

% percent of removal
prcntNum = 50;

name = {'Baby','Diana','Dolls','Snowman'};

for i=1:4
    org = ['Samples dataset\' , name{i} , '\' , name{i} ,'.png'];
    depth = ['Samples dataset\' , name{i} , '\' , name{i} '_Dmap','.png'];
    saliency = ['Samples dataset\' , name{i} , '\' , name{i} '_Smap','.png'];

    image = imread(org);
    depth = imread(depth);
    num = size(image,2) * prcntNum / 100;

    energy = energymap(image,depth);
    for j=1:num
        [energy, image] = seam_curve(energy,uint8(image));
        %imshow(uint8(image))
    end

    figure,imshow(uint8(image))
    imwrite(uint8(image),[name{i} '_Result.png'])
end



