#include <Rinternals.h>
#include <R_ext/Rdynload.h>

SEXP reverse_int(SEXP x) {
  if (TYPEOF(x) != INTSXP) error("Only for integer input");
  int n=LENGTH(x);

  SEXP out = PROTECT(allocVector(INTSXP, n));
  int *outp = INTEGER(out), *xp = INTEGER(x);

  for (int i=0; i<n; i++) {
    outp[i] = xp[n-i-1];
  }

  UNPROTECT(1);
  return out;
}

// for more: Registering native routines section of Writing R Extensions
static const R_CallMethodDef callMethods[] = {
  {"reverse_int_r_symbol", (DL_FUNC) &reverse_int, 1},
  {NULL, NULL, 0}
};

void R_init_rmini(DllInfo *info) {
  R_registerRoutines(
    info,
    /* methods available via .C()        */ NULL,
    /* methods available via .Call()     */ callMethods,
    /* methods available via .Fortran()  */ NULL,
    /* methods available via .External() */ NULL
  );
  // cannot use R_useDynamicSymbols while mixing registered/
  //   unregistered routines (reverse is unregistered)
  // R_useDynamicSymbols(info, FALSE);
  R_forceSymbols(info, TRUE);
}
