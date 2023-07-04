/////////////////////////////////////////////////////////////////////////
// non-fatal-assertions.h    —    non-fatal   assertions   for    glib //
/////////////////////////////////////////////////////////////////////////
// Copyright (C) 2023 Fredrick R. Brennan
// <copypaste@kittens.ph>
// 
// This  library is free software; you can redistribute it and/or  modify
// it  under  the  terms  of the GNU Lesser  General  Public  License  as
// published  by the Free Software Foundation; either version 2.1 of  the
// License, or (at your option) any later version. 
// 
// This  library  is distributed in the hope that it will be useful,  but
// WITHOUT   ANY   WARRANTY;  without  even  the  implied   warranty   of
// MERCHANTABILITY  or  FITNESS  FOR A PARTICULAR PURPOSE.  See  the  GNU
// Lesser General Public License for more details. 
// 
// You  should  have  received a copy of the GNU  Lesser  General  Public
// License along with this library; if not, write to: 
// 
// The Free Software Foundation, Inc.
// № 51 Franklin Street, Fifth Floor
// Boston, MA 02110-1301 USA
/////////////////////////////////////////////////////////////////////////

#ifndef NON_FATAL_ASSERTIONS_H

#include <glib/gmacros.h>
#include <glib.h>

#ifndef NDEBUG

#ifdef NO_NON_FATAL_ASSERTIONS
#define g_assert_nonfatal(expr) G_STMT_START{ (void)0; }G_STMT_END
#endif /* NO_NON_FATAL_ASSERTIONS */

#ifndef g_assert_nonfatal
#define g_assert_nonfatal(expr)                                      \
    G_STMT_START {                                                   \
      if (G_LIKELY (expr))                                           \
        ;                                                            \
      else                                                           \
        g_critical ("file %s: line %d (%s): assertion failed: (%s)", \
            __FILE__,                                                \
            __LINE__,                                                \
            G_STRFUNC,                                               \
            #expr);                                                  \
    } G_STMT_END
#undef g_assert
#define g_assert(x) G_STMT_START{ g_assert_nonfatal(x); }G_STMT_END
#endif /* g_assert_nonfatal */

#ifndef g_assert_not_reached_nonfatal
#define g_assert_not_reached_nonfatal(expr)                             \
    G_STMT_START {                                                      \
      g_critical ("file %s: line %d (%s): assertion not reached: (%s)", \
          __FILE__,                                                     \
          __LINE__,                                                     \
          G_STRFUNC,                                                    \
          #expr);                                                       \
    } G_STMT_END
#undef g_assert_not_reached
#define g_assert_not_reached(x) G_STMT_START{ g_assert_not_reached_nonfatal(x); }G_STMT_END
#endif /* g_assert_not_reached_nonfatal */

#endif /* !NDEBUG */
#endif /* NON_FATAL_ASSERTIONS_H */
