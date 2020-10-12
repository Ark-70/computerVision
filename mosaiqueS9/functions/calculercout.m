function cout = calculercout ( H, x1, y1, x2, y2)
    % On va calculer le cout de H*p
    % H matrice d'homographie
    % p un point

    % https://www.researchgate.net/post/Projector_onto_column_subspace_of_given_Matrix_A_Matlab

    % je calcule des homographies pour 4 paires de points, plein plein de
    % fois (L fois) et je garde celle qui minimise le coût
    
    p1 = [x1; y2; 1]
    % point qui a subit 
    pH = H*p1
    
    %% projection (Vision 3D S9.1.2)
    
    % projection sur l'axe Z
    pH = pH/pH(3)
    
    p2 = [x2; y2]
    ppH = p2 - pH
    cout = norm(pH)^2
    
    
    
    
    
    
    
    
    
    
    

end
