/* -*- mode: C; c-file-style: "gnu" -*- */
/* dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
 *
 * Copyright (C) 2003 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.0
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */
#if !defined (DBUS_INSIDE_DBUS_H) && !defined (DBUS_COMPILATION)
#error "Only <dbus/dbus.h> can be included directly, this file may disappear or change contents."
#endif

#ifndef DBUS_ARCH_DEPS_H
#define DBUS_ARCH_DEPS_H

#include <dbus/dbus-macros.h>

DBUS_BEGIN_DECLS

#if @DBUS_HAVE_INT64@
#define DBUS_HAVE_INT64 1
typedef @DBUS_INT64_TYPE@ dbus_int64_t;
typedef unsigned @DBUS_INT64_TYPE@ dbus_uint64_t;

#define DBUS_INT64_CONSTANT(val)  @DBUS_INT64_CONSTANT@
#define DBUS_UINT64_CONSTANT(val) @DBUS_UINT64_CONSTANT@

#else
#undef DBUS_HAVE_INT64
#undef DBUS_INT64_CONSTANT
#undef DBUS_UINT64_CONSTANT
#endif

typedef @DBUS_INT32_TYPE@ dbus_int32_t;
typedef unsigned @DBUS_INT32_TYPE@ dbus_uint32_t;

typedef @DBUS_INT16_TYPE@ dbus_int16_t;
typedef unsigned @DBUS_INT16_TYPE@ dbus_uint16_t;

DBUS_END_DECLS

#endif /* DBUS_ARCH_DEPS_H */
