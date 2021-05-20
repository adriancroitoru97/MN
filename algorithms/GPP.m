function [A, b] = GPP(A, b)
  n = length(b);
  A = [A, b];
  
  for p = 1:n-1
    maxim = max(abs(A(p:n, p)));
    for i = p:n
      if (A(i, p) == maxim)
        linie = i;
      endif
    endfor
    
    aux = A(p, :);
    A(p, :) = A(linie, :);
    A(linie, :) = aux;
    
    for i = p+1:n
      A(i, :) = A(i, :) - A(i, p) / A(p, p) * A(p, :);
    endfor
  endfor
  
  
  b = A(:, n + 1);
  A = A(1:n, 1:n);
  
endfunction