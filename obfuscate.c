/* Password encoder for Cisco VPN client.
   Copyright (C) 2009 Sebastian Wicki

   Derivated from cisco-decrypt - Copyright (C) 2005 Maurice Massar
   Thanks to HAL-9000@evilscientists.de for decoding and posting the algorithm!

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/*
   Requires libgcrypt version 1.1.90 or newer
   Compile with:
    gcc -Wall -o cisco-encrypt cisco-encrypt.c $(libgcrypt-config --libs --cflags)
   Usage:
    ./cisco-encrypt PASSWORD1 PASSWORD2 ...
*/

#include <stdio.h>
#include <stdlib.h>
#include <gcrypt.h>
#include <errno.h>
#include <time.h>

void printhex(unsigned char *buffer, int length) {
    int i;
    for(i=0; i<length; i++) {
        printf("%02X", buffer[i]);
    }
    printf("\n");
}

int c_encrypt(const char *pw, int pwlen, char **resp, int *reslenp) {
    char ht[20], h1[20], h2[20], h3[20], h4[20], key[24];
    const char *iv = h1;
    char *res, *enc, *tmp;
    int i, enclen = (pwlen%8) ? ((pwlen/8)+1)*8 : pwlen;

    gcry_cipher_hd_t ctx;
    time_t rawtime;
 
    time(&rawtime);
    tmp = ctime(&rawtime);

    /* h1 = SHA1 of ctime - bad source for entropy */
    gcry_md_hash_buffer(GCRY_MD_SHA1, h1, tmp, strlen(tmp));

    /* ht = temporary hash */
    memcpy(ht, h1, 20);

    /* h2 = SHA1 of modified h1*/
    ht[19]++;
    gcry_md_hash_buffer(GCRY_MD_SHA1, h2, ht, 20);

    /* h3 = SHA1 of modified h2 */
    ht[19] += 2;
    gcry_md_hash_buffer(GCRY_MD_SHA1, h3, ht, 20);

    /* key = h2 + (4 bytes of h3) */
    memcpy(key, h2, 20);
    memcpy(key+20, h3, 4);

    /* allocate buffer for in-place encryption */
    enc = malloc(enclen);
    if(enc == NULL) {
        return -1;
    }

    memcpy(enc, pw, pwlen);

    /* padding */
    for(i=pwlen; i<enclen; i++) {
        enc[i] = enclen - pwlen;
    }

    /* encrypt password with 3DES with iv = 8 bytes of h1, key = see above */
    gcry_cipher_open(&ctx, GCRY_CIPHER_3DES, GCRY_CIPHER_MODE_CBC, 0);
    gcry_cipher_setkey(ctx, key, 24);
    gcry_cipher_setiv(ctx, iv, 8);
    gcry_cipher_encrypt(ctx, (unsigned char *)enc, enclen, NULL, 0);
    gcry_cipher_close(ctx);

    /* h4 = SHA1 of encrypted password */
    gcry_md_hash_buffer(GCRY_MD_SHA1, h4, enc, enclen);

    /* hash length */    
    *reslenp = enclen+40;
    res = malloc(*reslenp);

    /* hash = h1 | h4 | encrypted password */
    memcpy(res, h1, 20);
    memcpy(res+20, h4, 20);
    memcpy(res+40, enc, enclen);
    
    *resp = res;

    free(enc);
    return 0;
}

int main(int argc, char *argv[]) {
    int i, ret = 0, pwlen, hashlen;
    char *hash;

    gcry_check_version(NULL);

    for (i = 1; i < argc; i++) {
        pwlen = strlen(argv[i])+1;
        
        ret = c_encrypt(argv[i], pwlen, &hash, &hashlen);
        if(ret != 0) {
            perror("encodig failed");
            continue;
        }

        printhex((unsigned char *)hash, hashlen);
        free(hash);
    }
    exit(ret != 0);
}

