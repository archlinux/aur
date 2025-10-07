#ifndef TYPED_AST_PYCOMPAT_H
#define TYPED_AST_PYCOMPAT_H

/* Compatibility shims for building typed-ast against newer CPython headers.
   Contains pragmatic fallbacks for a few internal helpers.

   NOTE: This file intentionally implements a conservative (but not full)
   decoder for C-style escape sequences used in bytes literals. It handles:
     - \\n \\r \\t \\\\ \\' \\" 
     - \\xHH (hex, two hex digits)
     - \\ooo (octal, up to 3 digits)
   It does NOT implement \N{name}, \\uXXXX, \\UXXXXXXXX, or every error-mode.
   If you need full CPython semantics we should either link against a Python
   build that exposes the original internal or port the full implementation.
*/

#include <Python.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Try to use _PyUnicode_FromId if present (borrowed ref); wrapper will INCREF */
extern PyObject* _PyUnicode_FromId(_Py_Identifier *id);
static inline PyObject *
_PyIdentifier_GetObject(_Py_Identifier *id)
{
    if (id == NULL) {
        PyErr_SetString(PyExc_SystemError, "NULL _Py_Identifier passed");
        return NULL;
    }
    PyObject *key = _PyUnicode_FromId(id);
    if (key != NULL) {
        Py_INCREF(key);
        return key;
    }
    PyErr_Clear();
    PyErr_SetString(PyExc_RuntimeError, "_PyUnicode_FromId unavailable");
    return NULL;
}

/* Small fallbacks used earlier */
#ifndef _PyObject_SetAttrId
static inline int
_PyObject_SetAttrId(PyObject *obj, _Py_Identifier *id, PyObject *value)
{
    PyObject *key = _PyIdentifier_GetObject(id);
    if (key == NULL) return -1;
    int res = PyObject_SetAttr(obj, key, value);
    Py_DECREF(key);
    return (res == 0) ? 0 : -1;
}
#endif

#ifndef _PyDict_SetItemId
static inline int
_PyDict_SetItemId(PyObject *p, _Py_Identifier *id, PyObject *val)
{
    PyObject *key = _PyIdentifier_GetObject(id);
    if (key == NULL) return -1;
    int res = PyDict_SetItem(p, key, val);
    Py_DECREF(key);
    return res;
}
#endif

#ifndef _PyLong_AsInt
static inline int
_PyLong_AsInt(PyObject *o)
{
    long v = PyLong_AsLong(o);
    if (v == -1 && PyErr_Occurred()) {
        return -1;
    }
    return (int)v;
}
#endif

#ifndef _PyObject_FastCall
static inline PyObject *
_PyObject_FastCall(PyObject *callable, PyObject **args, Py_ssize_t nargs)
{
    PyObject *tuple = PyTuple_New(nargs);
    if (tuple == NULL) {
        return NULL;
    }
    for (Py_ssize_t i = 0; i < nargs; ++i) {
        Py_XINCREF(args[i]);
        PyTuple_SET_ITEM(tuple, i, args[i]);
    }
    PyObject *res = PyObject_Call(callable, tuple, NULL);
    Py_DECREF(tuple);
    return res;
}
#endif

#ifndef _PyUnicode_EqualToASCIIString
static inline int
_PyUnicode_EqualToASCIIString(PyObject *u, const char *s)
{
    if (!PyUnicode_Check(u) || s == NULL) return 0;
    Py_ssize_t size;
    const char *u8 = PyUnicode_AsUTF8AndSize(u, &size);
    if (u8 == NULL) return -1;
    if ((Py_ssize_t)strlen(s) != size) return 0;
    return (memcmp(u8, s, size) == 0) ? 1 : 0;
}
#endif

/* Pragmatic implementation of _PyBytes_DecodeEscape used by typed-ast.
   Signature expected by typed-ast callsite:
     PyObject *_PyBytes_DecodeEscape(const char *s, Py_ssize_t len,
                                    const char *errors, const char **first_invalid_escape);
   It returns a new reference (PyObject*) for a bytes object on success,
   or NULL on failure. If first_invalid_escape is non-NULL and an invalid
   escape is encountered, *first_invalid_escape will point into s at the
   first invalid position. */
static inline PyObject *
_PyBytes_DecodeEscape(const char *s, Py_ssize_t len,
                      const char *errors, const char **first_invalid_escape)
{
    if (s == NULL || len < 0) {
        PyErr_SetString(PyExc_ValueError, "invalid input to _PyBytes_DecodeEscape");
        return NULL;
    }

    /* We'll decode into a buffer at most len bytes (since escapes produce <=1 byte each) */
    Py_ssize_t out_cap = len;
    char *out = (char *)PyMem_Malloc(out_cap + 1);
    if (out == NULL) {
        PyErr_NoMemory();
        return NULL;
    }
    Py_ssize_t out_i = 0;
    const char *p = s;
    const char *end = s + len;

    while (p < end) {
        char c = *p++;
        if (c != '\\') {
            out[out_i++] = c;
            continue;
        }

        /* Backslash: parse escape */
        if (p >= end) {
            /* lone backslash at end -> invalid */
            if (first_invalid_escape) *first_invalid_escape = p - 1;
            PyMem_Free(out);
            PyErr_SetString(PyExc_ValueError, "trailing backslash in escape sequence");
            return NULL;
        }

        char esc = *p++;
        switch (esc) {
            case '\\': out[out_i++] = '\\'; break;
            case 'n': out[out_i++] = '\n'; break;
            case 'r': out[out_i++] = '\r'; break;
            case 't': out[out_i++] = '\t'; break;
            case '\'': out[out_i++] = '\''; break;
            case '"': out[out_i++] = '"'; break;
            case 'a': out[out_i++] = '\a'; break;
            case 'b': out[out_i++] = '\b'; break;
            case 'f': out[out_i++] = '\f'; break;
            case 'v': out[out_i++] = '\v'; break;

            case 'x': {
                /* \xHH — require exactly two hex digits */
                if (p + 1 > end) { /* not enough chars */
                    if (first_invalid_escape) *first_invalid_escape = p - 2;
                    PyMem_Free(out);
                    PyErr_SetString(PyExc_ValueError, "invalid \\x escape");
                    return NULL;
                }
                int hi = -1, lo = -1;
                if (isxdigit((unsigned char)p[0])) hi = (isdigit((unsigned char)p[0]) ? p[0]-'0' : (tolower((unsigned char)p[0])-'a'+10));
                if (isxdigit((unsigned char)p[1])) lo = (isdigit((unsigned char)p[1]) ? p[1]-'0' : (tolower((unsigned char)p[1])-'a'+10));
                if (hi < 0 || lo < 0) {
                    if (first_invalid_escape) *first_invalid_escape = p - 2;
                    PyMem_Free(out);
                    PyErr_SetString(PyExc_ValueError, "invalid hex escape");
                    return NULL;
                }
                unsigned char val = (unsigned char)((hi << 4) | lo);
                out[out_i++] = (char)val;
                p += 2;
                break;
            }

            default:
                if (esc >= '0' && esc <= '7') {
                    /* octal escape: up to 3 octal digits (esc was first digit) */
                    int val = esc - '0';
                    int count = 1;
                    while (count < 3 && p < end && *p >= '0' && *p <= '7') {
                        val = val * 8 + (*p - '0');
                        p++; count++;
                    }
                    out[out_i++] = (char)val;
                    break;
                } else {
                    /* unknown escape — treat as invalid escape */
                    if (first_invalid_escape) *first_invalid_escape = p - 2;
                    PyMem_Free(out);
                    PyErr_Format(PyExc_ValueError, "unknown escape sequence: \\%c", esc);
                    return NULL;
                }
        }

        /* ensure capacity (very conservative) */
        if (out_i >= out_cap) {
            /* grow */
            Py_ssize_t new_cap = out_cap * 2 + 16;
            char *n = (char *)PyMem_Realloc(out, new_cap + 1);
            if (n == NULL) {
                PyMem_Free(out);
                PyErr_NoMemory();
                return NULL;
            }
            out = n;
            out_cap = new_cap;
        }
    }

    /* success: create bytes object */
    PyObject *res = PyBytes_FromStringAndSize(out, out_i);
    PyMem_Free(out);
    if (first_invalid_escape) *first_invalid_escape = NULL;
    return res;
}

#ifdef __cplusplus
}
#endif

#endif /* TYPED_AST_PYCOMPAT_H */
