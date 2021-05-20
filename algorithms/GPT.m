function [A b] = GPT(A, b)
  [n n] = size(A);
  
  for p = 1:n-1
    pivot = -inf;
    linie_pivot = -1;
    coloana_pivot = -1;
    
    %calc max in submatricea A(p:n, p:n)
    for i = p:n
      for j = p:n
        if (pivot < abs(A(i, j)))
          pivot = abs(A(i, j));
          linie_pivot = i;
          coloana_pivot = j;
        endif
      endfor
    endfor
    
    %permutarea liniilor linie_pivot si linia p
    if (p ~= linie_pivot)
      for j = p:n
        aux = A(p, j);
        A(p, j) = A(linie_pivot, j);
        A(linie_pivot, j) = aux;
      endfor
      
      %nu uitam elementele din b
      aux = b(p);
      b(p) = b(linie_pivot);
      b(linie_pivot) = aux;
    endif
    
    %permutarea coloanelor coloana_pivot si coloana p
    if (p ~= coloana_pivot)
      for i = p:n
        aux = A(i, p);
        A(i, p) = A(i, coloana_pivot);
        A(i, coloana_pivot) = aux;
      endfor
    endif
    
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