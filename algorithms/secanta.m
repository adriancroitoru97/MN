function sol = secanta(a, b, tol, poli)
  val_a = polyval(poli, a);
  if (val_a == 0)
    sol = a;
    return;
  endif
  
  val_b = polyval(poli, b);
  if (val_b == 0)
    sol = b;
    return;
  endif
  
  if val_a * val_b > 0
    disp("Interval invalid");
    return;
  endif
  
  eps = tol + 1;
  while eps > tol
    val_a = polyval(poli, a);
    val_b = polyval(poli, b);
    c = (a*val_b - b*val_a) / (val_b - val_a);
    val_c = polyval(poli, c);
    disp(c);
    if (val_a * val_c < 0)
      old = a;
      b = c;
    elseif (val_a * val_c > 0)
      old = b;
      a = c;
    elseif (val_a * val_c == 0)
      sol = c;
      return;
    endif
    
    new = c;
    if (new == 0)
      eps = abs(new - old);
    else
      eps = abs((new - old) / new);
    endif
    disp(eps);
  endwhile
  
  sol = new;
endfunction