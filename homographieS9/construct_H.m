function Hcp = f(recx, recy, w_ideal, h_ideal)
    % Construit la matrice d'homographie H depuis les 4 points idéaux

    % on va dire que les ui c'est nos idéaux (plan) et nos pci c'est dans la vue en 3D
    % donc ginput de notre extraction = pci
    px = recx;
    py = recy;

    % vvv c'est décidé en fonction de 4 points pris dans l'ordre horaire
    ux = [0 w_ideal w_ideal 0];
    uy = [0 0 h_ideal h_ideal];

    % Ai est la relation d'homographie mais pour uniquement 1 point
    Ai = [];
    for i = 1:4
        Ai = [Ai;
              ux(i) 0     -ux(i)*px(i) uy(i) 0      -uy(i)*px(i) 1 0
              0     ux(i) -ux(i)*py(i) 0     uy(i)  -uy(i)*py(i) 0 1];
    end


% Sachant que Ai*hcp = Pci
          %  8*8 8*1   8*1 ?
% donc si on veut calculer Hcp, c'est de la giga merde, et on prend la fonction matlab solvelinear

% linsolve(A, B) donne X pour AX = B
Pci = [recx(1);recy(1);recx(2);recy(2);recx(3);recy(3);recx(4);recy(4)]
hcp = linsolve(Ai, Pci);
Hcp = reshape( [hcp;1], [3,3])';


% X = A\V;

end
