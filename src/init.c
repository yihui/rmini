#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void rmini_reverse(void *, void *, void *, void *);

/* .Call calls */
extern SEXP rmini_reverse_int(SEXP);

static const R_CMethodDef CEntries[] = {
    {"rmini_reverse", (DL_FUNC) &rmini_reverse, 4},
    {NULL, NULL, 0}
};

static const R_CallMethodDef CallEntries[] = {
    {"rmini_reverse_int", (DL_FUNC) &rmini_reverse_int, 1},
    {NULL, NULL, 0}
};

void R_init_rmini(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
