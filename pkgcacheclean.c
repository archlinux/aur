#include <argp.h>
#include <dirent.h>
#include <inttypes.h>
#include <limits.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

#include <alpm.h>

#define ROOT "/"
#define DBPATH "/var/lib/pacman/"
#define CACHEDIR "/var/cache/pacman/pkg/"

const char *argp_program_version = "pkgcacheclean "VERSION;
const char *argp_program_bug_address = "auguste@gmail.com";

static char doc[] =
    "pkgcacheclean -- a simple utility to clean pacman cache.\v"
    "For installed packages, preserve_number of versions are reserved. This\n"
    "includes the current version and the newest (preserve_number - 1) of\n"
    "the remaining. For uninstalled packages all versions are deleted.\n"
    "The default number is 2.";
static char args_doc[] = "[preserve_number]";

static struct argp_option options[] =
{
    { .doc = "" },
    { .name = "dry-run", .key = 'n', .doc = "Perform a trial run with no changes made" },
    { .name = "cachedir", .key = 'd', .arg = "PATH",
      .doc = "Set alternative (absolute) cache directory PATH. Default is "CACHEDIR },
    { .name = "all-as-installed", .key = 'k',
      .doc = "Treat not-installed packages as installed" },
    { .name = "verbose", .key = 'v', .doc = "Verbose output" },
    { .name = "quiet", .key = 'q', .doc = "Suppress output, default" },
    { .doc = NULL }
};

static regex_t pkgnamesplit;
static regex_t pkgnametest;

struct pkginfo
{
    char *name;
    char *version;
    char *filename;
};

struct arguments
{
    int dry_run;
    int preserve;
    int keep;
    int verbose;
    char *cachedir;
};

static char *dupsubstr(const char *str, const int start, const int end)
{
    char *ret;
    const size_t len = (size_t)(end - start);

    ret = (char *)malloc(sizeof(char) * (len + 1));
    strncpy(ret, str + start, len);
    ret[len] = '\0';

    return ret;
}

static struct pkginfo * get_pkginfo_from_filename(const char * const filename)
{
    struct pkginfo *ret;
    static regmatch_t match[3];

    ret = (struct pkginfo *)malloc(sizeof(struct pkginfo));
    regexec(&pkgnamesplit, filename, 3, match, 0);
    ret->name = dupsubstr(filename, match[1].rm_so, match[1].rm_eo);
    ret->version = dupsubstr(filename, match[2].rm_so, match[2].rm_eo);
    ret->filename = strdup(filename);

    return ret;
}

static struct pkginfo * get_pkginfo_from_pmpkg(alpm_pkg_t *pmpkg)
{
    struct pkginfo *ret;

    ret = (struct pkginfo *)malloc(sizeof(struct pkginfo));
    ret->name = strdup(alpm_pkg_get_name(pmpkg));
    ret->version = strdup(alpm_pkg_get_version(pmpkg));
    ret->filename = NULL;

    return ret;
}

static void free_pkginfo(struct pkginfo * pkg)
{
    free(pkg->name);
    free(pkg->version);
    free(pkg->filename);
    free(pkg);
}

static int pkgcomp(const void *a, const void *b)
{
    struct pkginfo *ap = *(struct pkginfo **)a;
    struct pkginfo *bp = *(struct pkginfo **)b;

    int namecomp = strcmp(ap->name, bp->name);

    return namecomp ? namecomp : -alpm_pkg_vercmp(ap->version,
            bp->version);
}

static int pkgnamecomp(const void *a, const void *b)
{
    return strcmp((*(struct pkginfo **)a)->name,
            (*(struct pkginfo **)b)->name);
}

static int ispackage(const struct dirent *file)
{
    return regexec(&pkgnametest, file->d_name, 0, NULL, 0) == 0;
}

static void free_pkginfo_array(struct pkginfo **pkgs, const size_t n)
{
    size_t i;

    for (i = 0; i < n; i++)
        free_pkginfo(pkgs[i]);
    free(pkgs);
}

static off_t get_file_size(const char *filename)
{
    struct stat st;

    stat(filename, &st);
    return st.st_size;
}

static error_t parse_opt(int key, char *arg, struct argp_state *state)
{
    struct arguments *argument = (struct arguments *)(state -> input);

    switch (key)
    {
        case 'n':
            argument->dry_run = 1;
            break;
        case 'v':
            argument->verbose = 1;
            break;
        case 'k':
            argument->keep = 1;
        case 'q':
            argument->verbose = 0;
            break;
        case 'd':
            argument->cachedir = arg;
            break;
        case ARGP_KEY_ARG:
            if (argument->preserve)
                return ARGP_ERR_UNKNOWN;
            argument->preserve = atoi(arg);
            if (argument->preserve <= 0)
                return ARGP_ERR_UNKNOWN;
            break;
        default:
            return ARGP_ERR_UNKNOWN;
    }

    return 0;
}

int main(const int argc, char ** __restrict__ argv)
{
    int count = 0;
    size_t i, len, m = 0, n;
    off_t total_size = 0;
    alpm_handle_t *handle;
    struct stat st;
    struct dirent **dir;
    enum _alpm_errno_t error;
    struct pkginfo **cachepkg, **localpkg = NULL;
    struct pkginfo **hit = NULL;
    const char *current = "", *name;
    char cachedir[PATH_MAX] = CACHEDIR;
    struct argp arg_parser = { .options = options, .parser = parse_opt,
        .args_doc = args_doc, .doc = doc };
    struct arguments args = { .dry_run = 0, .preserve = 0, .keep = 0,
                              .verbose = 0, .cachedir = NULL };

    argp_parse(&arg_parser, argc, argv, 0, NULL, &args);
    if (!args.preserve)
        args.preserve = 2;

    if (!args.dry_run && getuid())
    {
        puts("please run as root.");
        exit(EXIT_FAILURE);
    }

    if (args.cachedir)
        strcpy(cachedir, args.cachedir);
    if (!((stat(cachedir, &st) == 0) && ((st.st_mode & S_IFMT) == S_IFDIR)))
    {
        printf("Cache directory does not exist or is not a valid directory: "
               "\"%s\".\n", cachedir);
        exit(EXIT_FAILURE);
    }
    len = strlen(cachedir);
    if (len && cachedir[len - 1] != '/')
    {
        cachedir[len] = '/';
        cachedir[++len] = '\0';
    }
    regcomp(&pkgnamesplit, "^(.*)-([^-]*-[^-]*)-[^-]*$", REG_EXTENDED);
    regcomp(&pkgnametest, "^.*-("CARCH"|any).[^-]*$", REG_EXTENDED);

    handle = alpm_initialize(ROOT, DBPATH, &error);

    n = (size_t)scandir(cachedir, &dir, ispackage, NULL);
    cachepkg = (struct pkginfo **)malloc(sizeof(struct pkginfo *) * n);
    for (i = 0; i < n; free(dir[i]), i++)
        cachepkg[i] = get_pkginfo_from_filename(dir[i]->d_name);
    free(dir);
    qsort(cachepkg, n, sizeof(struct pkginfo *), pkgcomp);

    if (!args.keep)
    {
        alpm_db_t *db;
        alpm_list_t *pkglist;

        db = alpm_get_localdb(handle);
        pkglist = alpm_db_get_pkgcache(db);
        m = alpm_list_count(pkglist);
        localpkg = (struct pkginfo **)malloc(sizeof(struct pkginfo *) * m);
        for (i = 0; i < m; i++, pkglist = alpm_list_next(pkglist))
            localpkg[i] = get_pkginfo_from_pmpkg((alpm_pkg_t *)(pkglist->data));
        qsort(localpkg, m, sizeof(struct pkginfo *), pkgnamecomp);
    }

    for (i = 0; i < n; i++)
    {
        name = cachepkg[i]->name;
        if (strcmp(name, current))
        {
            current = name;
            if (args.keep)
            {
                int j;
                for (j = (int)i - 1; j >= 0; j--)
                   if (pkgnamecomp(cachepkg + i, cachepkg + j))
                       break;
                hit = cachepkg + j + 1;
                count = 0;
            }
            else
            {
                hit = (struct pkginfo **)bsearch(cachepkg + i, localpkg, m,
                        sizeof(struct pkginfo *), pkgnamecomp);
                count = hit ? 0 : args.preserve;
            }
        }
        if (!hit || alpm_pkg_vercmp((*hit)->version,
                    cachepkg[i]->version))
        {
            count++;
            if (count >= args.preserve)
            {
                strcpy(cachedir + len, cachepkg[i]->filename);
                if (args.verbose)
                {
                    printf("remove: %s\n", cachepkg[i]->filename);
                    total_size += get_file_size(cachedir);
                }
                if (!args.dry_run)
                    unlink(cachedir);
            }
        }
    }

    if (args.verbose)
        printf("\ntotal: %"PRIuMAX" bytes\n", (uintmax_t)total_size);

    free_pkginfo_array(cachepkg, n);
    if (!args.keep)
        free_pkginfo_array(localpkg, m);

    alpm_release(handle);
    regfree(&pkgnametest);
    regfree(&pkgnamesplit);

    return EXIT_SUCCESS;
}
