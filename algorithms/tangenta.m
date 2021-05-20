function sol = tangenta(x, poli, tol)
  val = polyval(poli, x);
  disp(val);
  if (abs(val) < tol)
    sol = x;
    return;
  endif
  
  diff = polyder(poli);
  while(abs(val) > tol)
    val = polyval(poli, x);
    valdif = polyval(diff, x);
    disp(x);
    polyout(diff);
    x = x - val / valdif
  endwhile
  
  sol = x;
endfunction