function H_best = trouverHoptimal(H, duo_frame)
    % duo_frame = [frame1;frame2] = [x1; y1; s1; teta1; x1; y1; s1; teta1;]
    % 1) On chope 4 paires de points
    % 2) On estime H
    % 3) On évalue son coût
    % Répéter ça L fois

    L = 10
    nb_paires = 4 % taille de l'echantillon pour lequel calculer H
    couts = []
    
    for i = 1:L

        % selection de
        perm = randperm(size(frame,2)) ; % random permutation
        selecteur_random = perm(1:nb_paires) ; % des index aléatoires, dans 1:size(frame)
        frame(:,sel)

        % frame étant sous la forme (x, y, echelle, orientation)
        coord_frame = frame(1:2, :)

        % borner les distances aberrantes

        cout = calculercout(H, coord_frame)
        couts = [couts ; cout]


    end


end
