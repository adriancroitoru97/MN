function [x, err, steps] = SOR(A, b, x, w, tol, max_steps)
  x_old = x;
  n = length(A);
  steps = 0;
  
  while 1
    for i = 1:n
      x(i) = (1 - w) * x_old(i) + w / A(i, i) * (b(i) - A(i, 1:i-1) * x(1:i-1) - A(i, i+1:n) * x(i+1:n));
    endfor
    
    if ((err = norm(x - x_old)) < tol || ++steps > max_steps)
      return
    endif
    
    x_old = x;
  endwhile
endfunction