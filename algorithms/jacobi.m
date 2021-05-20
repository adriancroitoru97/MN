function [raza_spectrala, x, err, steps] = jacobi(A, b, x, tol, max_steps)
  n = length(A);
  x_old = x;
  
  D = diag(diag(A));
  P = -(A - D);
  raza_spectrala = max(abs(eig(inv(D) * P)));
  
  for steps = 1:max_steps
    for i = 1:n
      s1 = A(i, 1:i-1) * x_old(1:i-1);
      s2 = A(i, i+1:n) * x_old(i+1:n);
      x(i) = (b(i) - s1 - s2) / A(i, i);
    endfor

    if((err = norm(x - x_old)) < tol)
      return;
    endif

    x_old = x;
  endfor
endfunction