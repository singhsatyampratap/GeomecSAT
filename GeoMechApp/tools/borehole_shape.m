function borehole_shape(Radius_log,Depth_log,per_noise)
    %this function is plotting tool which plots the borehole shape with depth
    
    %input parameter
    %Radius_log:1D array of radius variation with depth(in m). %
    % you can also generate a schematic borehole of a particulator radius   
    %Depth_log:1D array of Depth(in m) 
    
    l=length(Depth_log);
    if length(Radius_log)==1
        Radius_log=Radius_log*(ones(l,1)+per_noise*randn(l,1));
    end
    
    [X,Y,Z]=cylinder(Radius_log);
    Z=Z*(-l*(Depth_log(2)-Depth_log(1)))-Depth_log(1);
    C=X.^2+Y.^2;
  
    surf(X,Y,Z,C,'EdgeColor',"none")
    
    view(90,4)
    
end
