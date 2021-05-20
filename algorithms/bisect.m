function [r, step, err] = bisect(f, a, b, tol, max_steps)
  for step=1:max_steps
    r = (a + b) / 2;
    
    if ( feval(f, a) * feval(f, r) < 0)
      b = r;
    else 
      a = r;
    endif
     
    if (( err = abs(b - a)) < tol)
      return
    endif
  endfor
endfunction