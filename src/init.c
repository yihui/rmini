#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void reverse(void *, void *, void *, void *);

/* .Call calls */
extern SEXP reverse_int(SEXP);

static const R_CMethodDef CEntries[] = {
    {"reverse", (DL_FUNC) &reverse, 4},
    {NULL, NULL, 0}
};

static const R_CallMethodDef CallEntries[] = {
    {"reverse_int", (DL_FUNC) &reverse_int, 1},
    {NULL, NULL, 0}
};

void R_init_rmini(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
