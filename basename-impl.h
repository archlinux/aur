/*
 * libkmod - interface to kernel module operations
 *
 * Copyright (C) 2024  Gonzalo Exequiel Pedone. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#pragma once
#ifndef _BASENAME_IMPL_H_
#define _BASENAME_IMPL_H_

#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

inline char *basename(char *path)
{
    int i;
    int len;
    int last;

    if (path == NULL)
        return NULL;

    len = strlen(path);
    last = len - 1;

    for (i = last; i >= 0; i--)
        if (*(path + i) == '/')
            return path + i + 1;

    return path + len;
}

#ifdef __cplusplus
} /* extern "C" */
#endif
#endif
