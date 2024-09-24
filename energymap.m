function energyMap = energymap(image, depthMap)

    I_gray = rgb2gray(image);
    % Use the gradient magnitude as the base energy map
    [Gx, Gy] = gradient(double(I_gray));
    gradientEnergy = abs(Gx) + abs(Gy);
    edgeEnergy = double(edge(I_gray,"canny"));
    
    % Normalize depth and map
    gradientMap = double(gradientEnergy) / max(double(gradientEnergy(:)));
    
    depthMap = double(depthMap) / max(double(depthMap(:)));
    %figure,imshow(gradientEnergy,[]);
    %figure,imshow(edgeEnergy);
    %figure,imshow(depthMap);
    
    % Combine the energy maps with weights
    alpha = double(0.7);
    beta = double(0.7);
    gamma = double(0.1);
    energyMap = alpha * depthMap + beta * gradientMap + gamma * edgeEnergy;
end