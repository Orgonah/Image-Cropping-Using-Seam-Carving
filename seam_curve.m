function [updated_energymap, resized_image] = seam_curve(energymap, image)

    dp = zeros(size(energymap)+2);
    dp(:,1) = 256;
    dp(:,size(dp,2)) = 256;
    for i=2: size(dp,1)-1
        for j=2: size(dp,2)-1
            dp(i,j) = energymap(i-1,j-1) + min(min(dp(i-1,j-1),dp(i-1,j)),dp(i-1,j+1));
        end
    end
    
    
    path = zeros(size(energymap,1),1);
    
    [t, min_col] = min(dp(end-1,:));
    
    for i=size(dp, 1)-1:-1:2
        
        path(i-1)=min_col-1;
        m = min(min(dp(i-1,min_col-1),dp(i-1,min_col)),dp(i-1,min_col+1));
        switch m
            case dp(i-1,min_col-1)
                min_col = min_col - 1;
            case dp(i-1,min_col)
                
            case dp(i-1,min_col+1)
                min_col = min_col + 1;
        end
    end
    
    updated_energymap = zeros(size(energymap,1),size(energymap,2)-1);
    resized_image = zeros(size(energymap,1),size(energymap,2)-1,3);
    for i=1:size(energymap,1)
        updated_energymap(i,:) = energymap(i,[1:path(i)-1, path(i)+1:end]);
        resized_image(i,:,:) = image(i,[1:path(i)-1, path(i)+1:end],:);
    end





end