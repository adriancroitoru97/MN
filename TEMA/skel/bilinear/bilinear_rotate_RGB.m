function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
        r = img(:,:,1);
    % TODO: extrage canalul verde al imaginii
        g = img(:,:,2);
    % TODO: extrace canalul albastru al imaginii
        b = img(:,:,3);

    % TODO: aplică rotația pe fiecare canal al imaginii
        r_final = bilinear_rotate(r, rotation_angle);
        g_final = bilinear_rotate(g, rotation_angle);
        b_final = bilinear_rotate(b, rotation_angle);
    % TODO: reconstruiește imaginea RGB finala (hint: cat)
        out = cat(3, r_final, g_final, b_final);
endfunction