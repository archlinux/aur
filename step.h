/**
 *   Performs a single step of the HAVEGE algorithm.
 *   Copyright (C) 2018 Leonardo Gates
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License along
 *   with this program; if not, write to the Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */
{
  flags               = state->P1[ 0 ] >> 20;

  HAVEGE_BRANCH_STRESS;

  flags               = flags >> 1;
  state->P2[ 0 ]      = ( state->P1[ 0 ] >> 18 ) & 7;

  state->P1[ 0 ]      = state->P1[ 0 ] & 0xfff;

  HARDCLOCK( state->clock );

  pt[ 0 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 0];
  pt[ 1 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 0 ];
  pt[ 2 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 1 ];
  pt[ 3 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 4 ];

  state->pool[ i + 0 ]     ^= *pt[ 0 ];
  state->pool[ i + 1 ]     ^= *pt[ 1 ];
  state->pool[ i + 2 ]     ^= *pt[ 2 ];
  state->pool[ i + 3 ]     ^= *pt[ 3 ];

  i                   += 4;

  j                   = ( *pt[ 0 ] >> 1 ) ^ ( *pt[ 0 ] << 31 ) ^ state->clock;
  *pt[ 0 ]            = ( *pt[ 1 ] >> 2 ) ^ ( *pt[ 1 ] << 30 ) ^ state->clock;
  *pt[ 1 ]            = j;
  *pt[ 2 ]            = ( *pt[ 2 ] >> 3 ) ^ ( *pt[ 2 ] << 29 ) ^ state->clock;
  *pt[ 3 ]            = ( *pt[ 3 ] >> 4 ) ^ ( *pt[ 3 ] << 28 ) ^ state->clock;

  pt[ 0 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 2 ];
  pt[ 1 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 2 ];
  pt[ 2 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 3 ];
  pt[ 3 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 6 ];

  state->pool[ i + 0 ]     ^= *pt[ 0 ];
  state->pool[ i + 1 ]     ^= *pt[ 1 ];
  state->pool[ i + 2 ]     ^= *pt[ 2 ];
  state->pool[ i + 3 ]     ^= *pt[ 3 ];

  i                   += 4;

  if( flags & 1 ) {
    tmp               = pt[ 0 ];
    pt[ 2 ]           = pt[ 0 ];
    pt[ 0 ]           = tmp;
  }

  flags               = ( state->P1[ 1 ] >> 18 );
  j                   = ( *pt[ 0 ] >> 5 ) ^ ( *pt[ 0 ] << 27 ) ^ state->clock;
  *pt[ 0 ]            = (*pt[ 1 ] >> 6 ) ^ ( *pt[ 1 ] << 26 ) ^ state->clock;
  *pt[ 1 ]            = j;

  HARDCLOCK( state->clock );

  *pt[ 2 ]            = ( *pt[ 2 ] >> 7 ) ^ ( *pt[ 2 ] << 25 ) ^ state->clock;
  *pt[ 3 ]            = ( *pt[ 3 ] >> 8 ) ^ ( *pt[ 3 ] << 24 ) ^ state->clock;

  pt[ 0 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 4 ];
  pt[ 1 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 1 ];

  state->P1[ 1 ]      = state->pool[( i - 8 ) ^ state->P2[ 1 ] ] ^ state->walk_ptr[ state->P1[ 1 ] ^ state->P2[ 1 ] ^ 7 ];
  state->P1[ 1 ]      = ( ( state->P1[ 1 ] & 0xfff ) & ( 0xfffffff7 ) ) ^ ( ( state->P1[ 0 ] ^ 8 ) & 8 );

  state->P2[ 1 ]      = ( ( state->P1[ 1 ] >> 28 ) & 7 );

  HAVEGE_BRANCH_STRESS;

  pt[ 2 ]             = &state->walk_ptr[state->P1[ 0 ]  ^ 5];
  pt[ 3 ]             = &state->walk_ptr[state->P1[ 1 ] ^ 5];

  state->pool[ i + 0 ]     ^= *pt[ 0 ];
  state->pool[ i + 1 ]     ^= *pt[ 1 ];
  state->pool[ i + 2 ]     ^= *pt[ 2 ];
  state->pool[ i + 3 ]     ^= *pt[ 3 ];

  i                   += 4;

  j                   = ( *pt[ 0 ] >> 9 )  ^ ( *pt[ 0 ] << 23 ) ^ state->clock;
  *pt[ 0 ]            = ( *pt[ 1 ] >> 10 ) ^ ( *pt[ 1 ] << 22 ) ^ state->clock;
  *pt[ 1 ]            = j;
  *pt[ 2 ]            = ( *pt[ 2 ] >> 11 ) ^ ( *pt[ 2 ] << 21 ) ^ state->clock;
  *pt[ 3 ]            = ( *pt[ 3 ] >> 12 ) ^ ( *pt[ 3 ] << 20 ) ^ state->clock;

  pt[ 0 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 6 ];
  pt[ 1 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 3 ];
  pt[ 2 ]             = &state->walk_ptr[ state->P1[ 0 ] ^ 7 ];
  pt[ 3 ]             = &state->walk_ptr[ state->P1[ 1 ] ^ 7 ];

  state->pool[ i + 0 ]     ^= *pt[ 0 ];
  state->pool[ i + 1 ]     ^= *pt[ 1 ];
  state->pool[ i + 2 ]     ^= *pt[ 2 ];
  state->pool[ i + 3 ]     ^= *pt[ 3 ];

  i                   += 4;

  j                   = ( *pt[ 0 ] >> 13 ) ^ ( *pt[ 0 ] << 19 ) ^ state->clock;
  *pt[ 0 ]            = ( *pt[ 1 ] >> 14 ) ^ ( *pt[ 1 ] << 18 ) ^ state->clock;
  *pt[ 1 ]            = j;
  *pt[ 2 ]            = ( *pt[ 2 ] >> 15 ) ^ ( *pt[ 2 ] << 17 ) ^ state->clock;
  *pt[ 3 ]            = ( *pt[ 3 ] >> 16 ) ^ ( *pt[ 3 ] << 16 ) ^ state->clock;
  state->P1[ 0 ]      = ( ( ( state->pool[ ( i - 8 ) ^ state->P2[ 0 ] ] ^ state->walk_ptr[ state->P1[ 0 ] ^ state->P2[ 0 ] ^ 7 ] ) ) & ( 0xffffffef ) ) ^ ( ( state->P1[ 1 ] ^ 0x10 ) & 0x10 );
}