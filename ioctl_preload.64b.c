/*
 * Spoof a MAC address with LD_PRELOAD
 *
 * If environment variable $MAC_ADDRESS is set in the form "01:02:03:04:05:06"
 * then use that value, otherwise pass through unchanged.
 *
 * Bugs: This currently spoofs MAC addresses for *all* interfaces.
 * It would be better to watch calls to socket() for the interfaces
 * you want and then only spoof ioctl calls to that file descriptor.
 *
 * Updated by Ed Avis for:
 * + 64-bit (needs -fPIC for compilation)
 * + Passes actual MAC address if env var unset (instead of hardcoded)
 * + More validation and sanity checking on env var
 *
 * (Untested by MarginalHacks.com)
 */
#include <dlfcn.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifndef RTLD_NEXT
#define RTLD_NEXT      ((void *) -1l)
#endif

#define SIOCGIFHWADDR 0x8927

const char *ENV_VAR = "MAC_ADDRESS";
const size_t EXPECTED_LEN = 17;

int
ioctl(int d, int request, unsigned char *argp)
{
        static void *handle = NULL;
        static int (*orig_ioctl)(int, int, char*);
        int ret;
        char *p;

        // If this var isn't set, leave alone.
        p=getenv(ENV_VAR);

        if (handle == NULL) {
                char *error;
                orig_ioctl = dlsym(RTLD_NEXT, "ioctl");
                if ((error = dlerror()) != NULL) {
                        fprintf(stderr, "%s\n", error);
                        exit(EXIT_FAILURE);
                }
        }
        
        ret = orig_ioctl(d, request, argp);
        
        if (p && strlen(p) && strlen(p) != EXPECTED_LEN) {
            fprintf(stderr, "malformed %s environment variable, expected length %d, got length %d from '%s'\n",
                    ENV_VAR, EXPECTED_LEN, strlen(p), p);
            exit(EXIT_FAILURE);
        }

        if (p && strlen(p) && request == SIOCGIFHWADDR) {
                unsigned char *ptr = argp + 18;
                int i;
                for (i=0; i < 6; i++) {
                        int val = 0;
                        if (p[0]>='0' && p[0]<='9') val |= (p[0]-'0')<<4;
                        else if (p[0]>='a' && p[0]<='f') val |= (p[0]-'a'+10)<<4;
                        else if (p[0]>='A' && p[0]<='F') val |= (p[0]-'A'+10)<<4;
                        else {
                            fprintf(stderr, "bad character '%c' in %s environment variable - expected hex digit\n", p[0], ENV_VAR);
                            exit(EXIT_FAILURE);
                        }
                        if (p[1]>='0' && p[1]<='9') val |= p[1]-'0';
                        else if (p[1]>='a' && p[1]<='f') val |= p[1]-'a'+10;
                        else if (p[1]>='A' && p[1]<='F') val |= p[1]-'A'+10;
                        else {
                            fprintf(stderr, "bad character '%c' in %s environment variable - expected hex digit\n", p[1], ENV_VAR);
                            exit(EXIT_FAILURE);
                        }
                        if (p[2]!=':' && p[2]!='\0') {
                            fprintf(stderr, "bad character '%c' in %s environment variable - expected : or end of string\n", p[2], ENV_VAR);
                            exit(EXIT_FAILURE);
                        }
                        ptr[i] = val;
                        p+=3;
                }
        }
        return ret;
}


