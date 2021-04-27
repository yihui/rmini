#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP reverse_int(SEXP x) {
  if (TYPEOF(x) != INTSXP) error("Only for integer input");
  int n = LENGTH(x);

  SEXP out = PROTECT(allocVector(INTSXP, n));
  int *outp = INTEGER(out), *xp = INTEGER(x);

  for (int i=0; i<n; i++) {
    outp[i] = xp[n-i-1];
  }

  UNPROTECT(1);
  return out;
}
