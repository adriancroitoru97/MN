function [Q R b] = givens(A, b)
  [m n] = size(A);
  Q = eye(m);
  
  lim = min(m-1, n);
  
  for k = 1:lim
    for l = k+1:m
      r = sqrt(A(k, k)^2 + A(l, k)^2);
      c = A(k, k)/r;
      s = -A(l, k)/r;
      
      vec_trig = [c -s; s c];
      
      aux = vec_trig*[A(k, k:n); A(l, k:n)];
      A(k, k:n) = aux(1, :);
      A(l, k:n) = aux(2, :);
      
      aux = vec_trig*[b(k); b(l)];
      b(k) = aux(1);
      b(l) = aux(2);
      
      aux = vec_trig*[Q(k, 1:m); Q(l, 1:m)];
      Q(k, 1:m) = aux(1, :);
      Q(l, 1:m) = aux(2, :);
    endfor
  endfor
  
  Q = Q';
  R = A;
endfunction