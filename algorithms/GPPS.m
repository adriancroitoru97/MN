function [A b index] = GPPS(A, b)
  index  = 0;
  [n n] = size(A);
  maxi = -inf;
  ip = -1;
  
  for p = 1:n-1
    %calculare ip
    for i = p:n
      si = max(abs(A(i, p:n)));
      disp(si);
      rap = abs(A(i, p)) / si;
      disp(rap);
      if (rap > maxi)
        index = index + 1;
        maxi = rap;
        ip = i;
      endif
    endfor
    disp(ip);
    %permutarea liniilor p si ip
    for j = 1:n
      aux = A(ip, j);
      A(ip, j) = A(p, j);
      A(p, j) = aux;
    endfor
    
    aux = b(ip);
    b(ip) = b(p);
    b(p) = aux;
    
    disp(A);
    disp(b);
    
    %de aici e identic cu alg G
    for i = p+1:n
      if (A(p, p) == 0)
        continue;
      endif
      
      tp = A(i, p) / A(p, p);
      A(i, p) = 0;
      for j = p+1:n
        A(i, j) = A(i, j) - tp*A(p, j);
      endfor
   
      b(i) = b(i) - tp*b(p);
    endfor
  endfor
endfunction