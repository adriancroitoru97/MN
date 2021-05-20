function [x, err, steps] = GS(A, b, x, tol, max_steps)
  x_old = x;
  
  N = tril(A);
  P = N - A;
  N_inv = inv(N);
  G = N_inv * P;
  c = N_inv * b;
  
  
  for steps = 1:max_steps
    x = G * x_old + c;
    
    if ((err = norm(x - x_old)) < tol)
      return;
    endif
    
    x_old = x;
  endfor
endfunction