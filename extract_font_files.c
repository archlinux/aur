#define _GNU_SOURCE
#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <libNeoAppleArchive.h>

static int ends_with_ci(const char *s, const char *suffix) {
    size_t a = strlen(s), b = strlen(suffix);
    if (a < b) return 0;
    s += a - b;
    for (size_t i = 0; i < b; ++i)
        if (tolower((unsigned char)s[i]) != tolower((unsigned char)suffix[i])) return 0;
    return 1;
}
static int is_font_path(const char *p) {
    static const char *allowed[] = {
        "System/Library/Fonts/",
        "System/Library/PrivateFrameworks/FontServices.framework/Versions/A/Resources/Fonts/ApplicationSupport/"
    };
    int permitted = 0;
    for (size_t i = 0; i < sizeof(allowed)/sizeof(allowed[0]); ++i)
        if (!strncmp(p, allowed[i], strlen(allowed[i]))) permitted = 1;
    if (!permitted) return 0;
    static const char *exts[] = {".ttf", ".ttc", ".otf", ".otc", ".dfont", ".woff", ".woff2", ".sfnt"};
    for (size_t i = 0; i < sizeof(exts)/sizeof(exts[0]); ++i)
        if (ends_with_ci(p, exts[i])) return 1;
    return 0;
}
static int mkdir_parents(char *path) {
    for (char *p = path + 1; *p; ++p) {
        if (*p == '/') {
            *p = '\0';
            if (mkdir(path, 0755) != 0 && errno != EEXIST) return -1;
            *p = '/';
        }
    }
    return 0;
}
int main(int argc, char **argv) {
    if (argc != 3) { fprintf(stderr, "usage: %s archive.yaa output-root\n", argv[0]); return 2; }
    const char *archive_path = argv[1], *root = argv[2];
    NeoAAArchiveGeneric generic = neo_aa_archive_generic_from_path(archive_path);
    if (!generic || !generic->raw) { fprintf(stderr, "could not open Apple Archive: %s\n", archive_path); return 1; }
    size_t files = 0, bytes = 0;
    for (int i = 0; i < generic->raw->itemCount; ++i) {
        NeoAAArchiveItem item = generic->raw->items[i];
        int pat_idx = neo_aa_header_get_field_key_index(item->header, NEO_AA_FIELD_C("PAT"));
        int typ_idx = neo_aa_header_get_field_key_index(item->header, NEO_AA_FIELD_C("TYP"));
        if (pat_idx < 0 || typ_idx < 0 || neo_aa_header_get_field_key_uint(item->header, typ_idx) != 'F') continue;
        char *rel = neo_aa_header_get_field_key_string(item->header, pat_idx);
        if (!rel) continue;
        if (!is_font_path(rel) || rel[0] == '/' || strstr(rel, "../") || !strcmp(rel, "..")) { free(rel); continue; }
        size_t need = strlen(root) + strlen(rel) + 2;
        char *full = malloc(need);
        if (!full) { free(rel); return 1; }
        snprintf(full, need, "%s/%s", root, rel);
        if (mkdir_parents(full) != 0) { fprintf(stderr, "mkdir failed: %s: %s\n", full, strerror(errno)); free(full); free(rel); return 1; }
        FILE *fp = fopen(full, "wb");
        if (!fp) { fprintf(stderr, "open failed: %s: %s\n", full, strerror(errno)); free(full); free(rel); return 1; }
        size_t n = item->encodedBlobDataSize ? fwrite(item->encodedBlobData, 1, item->encodedBlobDataSize, fp) : 0;
        if (fclose(fp) != 0 || n != item->encodedBlobDataSize) { fprintf(stderr, "write failed: %s\n", full); free(full); free(rel); return 1; }
        if (n == 0) unlink(full);
        else { files++; bytes += n; }
        free(full); free(rel);
    }
    printf("%s: extracted %zu files, %zu bytes\n", archive_path, files, bytes);
    return 0;
}
