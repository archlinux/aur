/* USER RE-DEFINABLE MACROS */

#ifndef CB_BUF_SIZE // Avoids redefinition error if '-D CB_BUF_SIZE=<number>' is used
    /* Sets the size of text buffers */
    #define CB_BUF_SIZE 32768 // Change the value to change the size of text buffers
#endif

/* Uses strcpy and strcat in place of copyStr and copyStrApnd */
#define BUILT_IN_STRING_FUNCS // Comment out this line to use CLIBASIC string functions

/* Sets what file CLIBASIC uses to store command history */
#define HIST_FILE ".clibasic_history" // Change the value to change where CLIBASIC puts the history file

/* Changes the terminal title to display the CLIBASIC version and bits */
#define CHANGE_TITLE // Comment out this line to disable changing the terminal/console title

#ifdef _WIN32 // Avoids defining _WIN_NO_VT on a non-Windows operating system
    /* Enables support for Windows before Windows 10 build 16257 (no VT escape code support) */
    //#define _WIN_NO_VT // Un-comment this line if you are using a version of Windows proceeding Windows 10 build 16257
#endif

/* ------------------------ */

/* Fix implicit declaration issues */
#define _POSIX_C_SOURCE 999999L
#define _XOPEN_SOURCE 999999L

/* Check if the buffer size is usable */
#if (CB_BUF_SIZE < 0)
    #error /* CB_BUF_SIZE cannot be less than 0 */ \
    Invalid value for CB_BUF_SIZE (CB_BUF_SIZE cannot be less than 0).
#elif (CB_BUF_SIZE < 2)
    #error /* Buffers only have room for NULL char */ \
    Unusable CB_BUF_SIZE (Buffers only have room for NULL char).
#elif (CB_BUF_SIZE < 256)
    #warning /* Buffers will be small and may cause issues. */ \
    Small CB_BUF_SIZE (Buffers will be small and may cause issues).
#endif

#ifndef _WIN32 // NOTE: Assumes Unix-based system on anything except Windows
    #ifndef __unix__
        #define __unix__
    #endif
#endif

#include <math.h>
#include <time.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <setjmp.h>
#include <dirent.h>
#include <stdbool.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <readline/readline.h>
#include <readline/history.h>
#ifdef __unix__
#include <termios.h>
#include <sys/ioctl.h>
#endif
#ifdef _WIN32
#include <windows.h>
#include <conio.h>
#include <fileapi.h>
#define SIGKILL 9
#endif

char VER[] = "0.15.8";

#if defined(__linux__)
    char OSVER[] = "Linux";
#elif defined(BSD)
    char OSVER[] = "BSD";
#elif defined(__APPLE__)
    char OSVER[] = "MacOS";
#elif defined(__unix__)
    char OSVER[] = "Unix";
#elif defined(_WIN32)
    char OSVER[] = "Windows";
#else
    #warning /* No matching operating system defines */ \
    Could not detect operating system. (No matching operating system defines; this may cause compilation failure)
    char OSVER[] = "?";
#endif

#ifdef B32
    char BVER[] = "32";
#elif B64
    char BVER[] = "64";
#else
    #warning /* Neither B32 or B64 was defined */ \
    Could not detect architecture bits. Please use '-DB64' or '-DB32' when compiling. (Neither B32 or B64 was defined)
    char BVER[] = "?";
#endif

FILE* prog;
char* progbuf = NULL;
char* argptr;
FILE* f[256];

int err = 0;
int cerr;

bool inProg = false;
bool chkinProg = false;
char* progFilename = NULL;
int progLine = 1;

int* varlen;
char** varstr;
char** varname;
bool* varinuse;
uint8_t* vartype;
int varmaxct = 0;

char* cmd;
int cmdl;
char** tmpargs;
char** arg;
uint8_t* argt;
int* argl;
int argct = 0;

int cmdpos;

bool didloop = false;
bool lockpl = false;

int dlstack[256];
int dlpline[256];
bool dldcmd[256];
int dlstackp = -1;

bool itdcmd[256];
int itstackp = -1;
bool didelse = false;

int fnstack[256];
bool fndcmd[256];
bool fninfor[256];
int fnpline[256];
int fnstackp = -1;
char fnvar[CB_BUF_SIZE];
char forbuf[4][CB_BUF_SIZE];

char* errstr;

char conbuf[CB_BUF_SIZE];
char prompt[CB_BUF_SIZE];
char pstr[CB_BUF_SIZE];

uint8_t fgc = 15;
uint8_t bgc = 0;

int curx;
int cury;

int64_t cp = 0;

bool cmdint = false;
bool inprompt = false;

jmp_buf ctrlc_buf;

bool debug = false;
bool runfile = false;

bool sh_silent = false;
bool sh_clearAttrib = true;
bool sh_restoreAttrib = true;

bool txt_bold = false;
bool txt_italic = false;
bool txt_underln = false;
bool txt_underlndbl = false;
bool txt_underlnsqg = false;
bool txt_strike = false;
bool txt_overln = false;
bool txt_dim = false;
bool txt_blink = false;
bool txt_hidden = false;
bool txt_reverse = false;
bool txt_fgc = true;
bool txt_bgc = false;
int  txt_underlncolor = 0;

bool textlock = false;

bool keep = false;

char* homepath = NULL;
char* cwd = NULL;

bool autohist = false;

int tab_width = 4;

char** termargs = NULL;
char* startcmd = NULL;

bool changedtitle = false;
bool changedtitlecmd = false;

#ifdef __unix__
struct termios term, restore;

void txtqunlock() {if (textlock) {tcsetattr(0, TCSANOW, &restore); textlock = false;}}

int kbhit() {
    static const int STDIN = 0;
    static bool initialized = false;
    if (!initialized) {
        struct termios term;
        tcgetattr(STDIN, &term);
        term.c_lflag &= ~ICANON;
        tcsetattr(STDIN, TCSANOW, &term);
        setbuf(stdin, NULL);
        initialized = true;
    }
    int bytesWaiting;
    ioctl(STDIN, FIONREAD, &bytesWaiting);
    return bytesWaiting;
}
#endif

int tab_end = 0;
void strApndChar(char* str, char c);
char* rl_get_tab(const char* text, int state) {
    char* tab = NULL;
    rl_filename_quoting_desired = 0;
    if (!state) {
        tab = malloc(strlen(text) + 5);
        strcpy(tab, text);
        tab_end = tab_width - (tab_end % tab_width) - 1;
        if (!tab_end) tab_end = tab_width;
        fflush(stdout);
        for (int i = 0; i < tab_end; i++) {
            strApndChar(tab, ' ');
        }
    }
    return tab;
}
char** rl_tab(const char* text, int start, int end) {
    (void)start;
    char** tab = NULL;
    tab_end = end;
    tab = rl_completion_matches(text, rl_get_tab);
    return tab;
}

#ifdef _WIN32
//(https://pbs.twimg.com/media/CRcU7BKWwAEQZIE.jpg)
char* rlptr;
bool inrl = false;
void cleanExit();
void setcsr() {
    COORD coord;
    coord.X = 0;
    coord.Y = 0;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}
void rl_sigh(int sig) {signal(sig, rl_sigh);}
void txtqunlock() {}
HANDLE hConsole;
//(https://i.kym-cdn.com/entries/icons/original/000/027/746/crying.jpg)
#ifndef ENABLE_VIRTUAL_TERMINAL_PROCESSING
#define ENABLE_VIRTUAL_TERMINAL_PROCESSING 4
#endif
char kbinbuf[256];
#endif

struct timeval time1;
uint64_t tval;

void forceExit() {
    txtqunlock();
    exit(0);
}

void getCurPos();

char* gethome();

void cleanExit() {
    #ifdef __unix__
    if (inprompt) {putchar('\n'); signal(SIGINT, cleanExit); longjmp(ctrlc_buf, 1); return;}
    #endif
    txtqunlock();
    signal(SIGINT, forceExit);
    signal(SIGKILL, forceExit);
    signal(SIGTERM, forceExit);
    int ret = chdir(gethome());
    (void)ret;
    if (autohist) write_history(HIST_FILE);
    #ifdef _WIN32
    SetFileAttributesA(HIST_FILE, FILE_ATTRIBUTE_HIDDEN);
    #endif
    #if defined(CHANGE_TITLE) && !defined(_WIN_NO_VT)
    if (changedtitle) fputs("\e[23;0t", stdout);
    #endif
    #ifndef _WIN_NO_VT
    if (!keep) fputs("\e[0m", stdout);
    #endif
    getCurPos();
    if (curx != 1) putchar('\n');
    #ifndef _WIN_NO_VT
    fputs("\e[2K", stdout);
    #endif
    exit(err);
}

void cmdIntHndl() {
    if (cmdint) signal(SIGINT, cleanExit);
    cmdint = true;
}

void runcmd();
#ifdef BUILT_IN_STRING_FUNCS
    #define copyStr(b, a) strcpy(a, b)
    #define copyStrApnd(b, a) strcat(a, b)
#else
    void copyStr(char* str1, char* str2);
    void copyStrApnd(char* str1, char* str2);
#endif
void copyStrSnip(char* str1, int i, int j, char* str2);
uint8_t getVal(char* inbuf, char* outbuf);
void resetTimer();
void loadProg();
void updateTxtAttrib();
bool isFile();

char* gethome() {
    if (!homepath) {
        #ifdef __unix__
        homepath = getenv("HOME");
        #else
        char* str1 = getenv("HOMEDRIVE");
        char* str2 = getenv("HOMEPATH");
        homepath = malloc(strlen(str1) + strlen(str2) + 1);
        copyStr(str1, homepath);
        copyStrApnd(str2, homepath);
        #endif
    }
    return homepath;
}

int main(int argc, char** argv) {
    #ifdef __unix__
    if (system("tty -s 1> /dev/null 2> /dev/null")) {
        char command[CB_BUF_SIZE];
        copyStr("xterm -T CLIBASIC -b 0 -bg black -bcn 200 -bcf 200 -e 'echo -e -n \"\x1b[\x33 q\" && ", command);
        copyStrApnd(argv[0], command);
        strApndChar(command, '\'');
        exit(system(command));
    }
    #endif
    signal(SIGINT, cleanExit);
    signal(SIGKILL, cleanExit);
    signal(SIGTERM, cleanExit);
    rl_readline_name = "CLIBASIC";
    char* rl_tmpptr = calloc(1, 1);
    rl_completion_entry_function = rl_get_tab;
    rl_attempted_completion_function = (rl_completion_func_t*)rl_tab;
    #ifdef __unix__
    rl_getc_function = getc;
    #endif
    rl_special_prefixes = rl_tmpptr;
    rl_completer_quote_characters = rl_tmpptr;
    rl_completer_word_break_characters = rl_tmpptr;
    #ifdef _WIN32
    hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    if (hConsole == INVALID_HANDLE_VALUE) {
        fputs("Failed to open a valid console handle.\n", stderr);
        err = GetLastError();
        cleanExit();
    }
    #endif
    #if defined(_WIN32) && !defined(_WIN_NO_VT)
    DWORD dwMode = 0;
    if (!GetConsoleMode(hConsole, &dwMode)){
        fputs("Failed to get the console mode.\n", stderr);
        err = GetLastError();
        cleanExit();
    }
    dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
    if (!SetConsoleMode(hConsole, dwMode)) {
        fputs("Failed to set the console mode.\n", stderr);
        err = GetLastError();
        cleanExit();
    }
    #endif
    getCurPos();
    if (curx != 1) putchar('\n');
    bool pexit = false;
    for (int i = 1; i < argc; i++) {
        if (argv[i][0] == '-' && strcmp(argv[i], "--file") && strcmp(argv[i], "-f")) {
            if (!strcmp(argv[i], "--version") || !strcmp(argv[i], "-v")) {
                if (argc > 2) {fputs("Incorrect number of options passed.\n", stderr); err = 1; cleanExit();}
                printf("Command Line Interface BASIC version %s (%s %s-bit)\n", VER, OSVER, BVER);
                puts("Copyright (C) 2021 PQCraft");
                puts("This software is licensed under the GNU GPL v3.");
                pexit = true;
            } else if (!strcmp(argv[i], "--help") || !strcmp(argv[i], "-h")) {
                if (argc > 2) {fputs("Incorrect number of options passed.\n", stderr); err = 1; cleanExit();}
                printf("Usage: %s [options] [{--file|-f}] [file] [options]\n", argv[0]);
                puts("Options:");
                puts("    {-f|--file} <file>          Loads and runs <file>.");
                puts("    {-c|--command} <command>    Runs <command> and exits.");
                puts("    {-k|--keep}                 Stops CLIBASIC from resetting text attributes.");
                puts("    {-h|--help}                 Shows this help text.");
                puts("    {-v|--version}              Shows the version and license information.");
                puts("    {-d|--debug}                Enables the printing of debug information.");
                pexit = true;
            } else if (!strcmp(argv[i], "--debug") || !strcmp(argv[i], "-d")) {
                if (debug) {fputs("Incorrect number of options passed.\n", stderr); err = 1; cleanExit();}
                debug = true;
            } else if (!strcmp(argv[i], "--keep") || !strcmp(argv[i], "-k")) {
                if (keep) {fputs("Incorrect number of options passed.\n", stderr); err = 1; cleanExit();}
                keep = true;
            } else if (!strcmp(argv[i], "--command") || !strcmp(argv[i], "-c")) {
                i++;
                if (!argv[i]) {fputs( "No command provided.\n", stderr); err = 1; cleanExit();}
                inProg = true;
                runfile = true;
                argptr = argv[i];
            } else {
                fprintf(stderr, "Invalid option '%s'\n", argv[i]); err = 1; cleanExit();
            }
        } else {
            if (runfile) {free(progFilename); fputs("Incorrect number of options passed.\n", stderr); cleanExit();}
            if (!strcmp(argv[i], "--file") || !strcmp(argv[i], "-f")) {
                i++;
                if (!argv[i]) {fputs( "No filename provided.\n", stderr); err = 1; cleanExit();}
            }
            inProg = true;
            runfile = true;
            prog = fopen(argv[i], "r");
            progFilename = malloc(strlen(argv[i]) + 1);
            copyStr(argv[i], progFilename);
            if (!prog) {fprintf(stderr, "File not found: '%s'.\n", progFilename); free(progFilename); err = 1; cleanExit();}
            if (!isFile(progFilename)) {puts("Expected file instead of directory."); err = 1; cleanExit();}
        }
    }
    if (pexit) cleanExit();
    if (!isatty(STDERR_FILENO) && !inProg) {exit(1);}
    if (!isatty(STDIN_FILENO) && !inProg) {fputs("CLIBASIC does not support piping in shell mode.\n", stderr); exit(1);}
    if (!isatty(STDOUT_FILENO) && !inProg) {fputs("CLIBASIC does not support redirection in shell mode.\n", stderr); exit(1);}
    updateTxtAttrib();
    termargs = argv;
    if (argv[0][0] == '.') {
        #ifdef _WIN32
        startcmd = _fullpath(NULL, argv[0], CB_BUF_SIZE);
        #else
        startcmd = realpath(argv[0], NULL);
        #endif
    }
    if (!startcmd) startcmd = argv[0];
    if (!runfile) {
        printf("Command Line Interface BASIC version %s (%s %s-bit)\n", VER, OSVER, BVER);
        strcpy(prompt, "\"CLIBASIC> \"");
        #ifdef CHANGE_TITLE
        #ifndef _WIN_NO_VT
        fputs("\e[22;0t", stdout);
        changedtitle = true;
        printf("\e]2;CLIBASIC %s (%s-bit)%c", VER, BVER, 7);
        fflush(stdout);
        #else
        char* tmpstr = malloc(CB_BUF_SIZE);
        sprintf(tmpstr, "CLIBASIC %s (%s-bit)", VER, BVER);
        SetConsoleTitleA(tmpstr);
        free(tmpstr);
        #endif
        #endif
    }
    if (debug) printf("Running in debug mode\n");
    if (!progbuf) progbuf = NULL;
    errstr = NULL;
    cmd = NULL;
    argt = NULL;
    arg = NULL;
    srand(time(0));
    if (runfile) {
        if (!progFilename) {
            progFilename = malloc(9);
            strcpy(progFilename, "argument");
            progbuf = realloc(progbuf, strlen(argptr) + 1);
            bool inStr = false;
            bool comment = false;
            int j = 0;
            while (*argptr) {
                int tmpc = *argptr;
                argptr++;
                if (tmpc == '"') inStr = !inStr;
                if (tmpc == '\'' && !inStr) comment = true;
                if (tmpc == '\n') comment = false;
                if (tmpc == '\r' || tmpc == '\t') tmpc = ' ';
                if (!comment) {progbuf[j] = (char)tmpc; j++;}
            }
        }
        else {loadProg();}
    } else {
        if (!gethome()) {
            #ifdef __unix__
            fputs("Could not find home folder! Please set the 'HOME' environment variable.", stderr);
            #else
            fputs("Could not find home folder!", stderr);
            #endif
        } else {
            char* tmpcwd = getcwd(NULL, 0);
            int ret = chdir(homepath);
            FILE* tmpfile = fopen(HIST_FILE, "r");
            if ((autohist = (bool)tmpfile)) {fclose(tmpfile); read_history(HIST_FILE);}
            prog = fopen("AUTORUN.BAS", "r"); progFilename = malloc(12); strcpy(progFilename, "AUTORUN.BAS");
            if (!prog) {prog = fopen("autorun.bas", "r"); strcpy(progFilename, "autorun.bas");}
            if (!prog) {free(progFilename);}
            else {
                if (isFile(progFilename)) {loadProg(); inProg = true;}
            }
            ret = chdir(tmpcwd);
            (void)ret;
        }
    }
    resetTimer();
    while (!pexit) {
        fchkint:
        conbuf[0] = 0;
        if (chkinProg) {inProg = true; chkinProg = false;}
        if (!inProg) {
            if (runfile) {txtqunlock(); err = cerr; cleanExit();}
            char* tmpstr = NULL;
            int tmpt = getVal(prompt, pstr);
            if (tmpt != 1) strcpy(pstr, "CLIBASIC> ");
            getCurPos();
            #ifdef __unix__
            curx--;
            int ptr = strlen(pstr);
            while (curx) {pstr[ptr] = 22; ptr++; curx--;}
            pstr[ptr] = 0;
            #else
            if (curx > 1) putchar('\n');
            #endif
            updateTxtAttrib();
            inprompt = true;
            #ifdef __unix__
            setjmp(ctrlc_buf);
            #else
            signal(SIGINT, rl_sigh);
            #endif
            tmpstr = readline(pstr);
            inprompt = false;
            if (!tmpstr) cleanExit();
            if (tmpstr[0] == 0) {free(tmpstr); goto brkproccmd;}
            HIST_ENTRY* tmphist = history_get(history_length);
            if (!tmphist || strcmp(tmpstr, tmphist->line)) add_history(tmpstr);
            copyStr(tmpstr, conbuf);
            free(tmpstr);
        }
        cp = 0;
        cmdl = 0;
        dlstackp = -1;
        itstackp = -1;
        fnstackp = -1;
        for (int i = 0; i < 256; i++) {
            dlstack[i] = 0;
            dldcmd[i] = false;
            fnstack[i] = -1;
            fndcmd[i] = false;
            fninfor[i] = false;
            itdcmd[i] = false;
        }
        didloop = false;
        didelse = false;
        bool inStr = false;
        if (!runfile) signal(SIGINT, cmdIntHndl);
        progLine = 1;
        bool comment = false;
        while (1) {
            #ifdef _WIN32
            if (!textlock) {
                char kbc;
                int kbh = kbhit();
                for (int i = 0; i < kbh; i++) {
                    kbc = _getch();
                    kbinbuf[i] = kbc;
                    //printf("[%d]: [%d]\n", i, kbc);
                    putchar(kbc);
                    if (kbc == 3) {
                        if (inProg) {goto brkproccmd;}
                        else {cmdIntHndl();}
                    }
                }
                fflush(stdout);
            }
            #endif
            if (inProg) {
                if (progbuf[cp] == '"') {inStr = !inStr; cmdl++;} else
                if ((progbuf[cp] == ':' && !inStr) || progbuf[cp] == '\n' || progbuf[cp] == 0) {
                    if (progbuf[cp - cmdl - 1] == '\n' && !lockpl) {progLine++; if (debug) printf("found nl: [%lld]\n", (long long int)cp);}
                    if (lockpl) lockpl = false;
                    while (progbuf[cp - cmdl] == ' ' && cmdl > 0) {cmdl--;}
                    cmd = realloc(cmd, (cmdl + 1) * sizeof(char));
                    cmdpos = cp - cmdl;
                    copyStrSnip(progbuf, cp - cmdl, cp, cmd);
                    cmdl = 0;
                    if (debug) printf("conbuf: {%s}\n", conbuf);
                    runcmd();
                    if (cmdint) {inProg = false; if (prog != NULL) {fclose(prog);} free(progFilename); cmdint = false; goto brkproccmd;}
                    if (cp == -1) {inProg = false; if (prog != NULL) {fclose(prog);} free(progFilename); goto brkproccmd;}
                    if (progbuf[cp] == 0) {inProg = false; if (prog != NULL) {fclose(prog);} free(progFilename); goto brkproccmd;}
                } else
                {cmdl++;}
                if (!didloop) {cp++;} else {didloop = false;}
            } else {
                if (!inStr && conbuf[cp] == '\'') comment = true;
                if (conbuf[cp] == '"') {inStr = !inStr; cmdl++;} else
                if ((conbuf[cp] == ':' && !inStr) || conbuf[cp] == 0) {
                    comment = false;
                    while (conbuf[cp - cmdl] == ' ' && cmdl > 0) {cmdl--;}
                    cmd = realloc(cmd, (cmdl + 1) * sizeof(char));
                    cmdpos = cp - cmdl;
                    copyStrSnip(conbuf, cp - cmdl, cp, cmd);
                    cmdl = 0;
                    if (debug) printf("calling runcmd()\n");
                    runcmd();
                    if (cmdint) {txtqunlock(); cmdint = false; goto brkproccmd;}
                    if (cp == -1) goto brkproccmd;
                    if (conbuf[cp] == 0) goto brkproccmd;
                    if (chkinProg) goto fchkint;
                } else
                {cmdl++;}
                if (!didloop) {if (comment) {conbuf[cp] = 0;} cp++;} else {didloop = false;}
            }
        }
        brkproccmd:
        #ifdef __unix__
        signal(SIGINT, cleanExit);
        #endif
        txtqunlock();
    }
    txtqunlock();
    cleanExit();
    return 0;
}

uint64_t usTime() {
    gettimeofday(&time1, NULL);
    return time1.tv_sec * 1000000 + time1.tv_usec;
}

uint64_t timer() {
    return usTime() - tval;
}

void resetTimer() {
    tval = usTime();
}

void cb_wait(uint64_t d) {
    #ifdef __unix__
    struct timespec dts;
    dts.tv_sec = d / 1000000;
    dts.tv_nsec = (d % 1000000) * 1000;
    nanosleep(&dts, NULL);
    #else
    uint64_t t = d + usTime();
    while (t > usTime() && !cmdint) {}
    #endif
}

bool isFile(char* path) {
    struct stat pathstat;
    stat(path, &pathstat);
    return !(S_ISDIR(pathstat.st_mode));
}

void getTermSize() {

}

void getCurPos() {
    fflush(stdout);
    cury = 0; curx = 0;
    #ifndef _WIN32
    char buf[16];
    register int ret, i;
    i = kbhit();
    while (i > 0) {getchar(); i--;}
    if (!textlock) {
        tcgetattr(0, &term);
        tcgetattr(0, &restore);
        term.c_lflag &= ~(ICANON|ECHO);
        tcsetattr(0, TCSANOW, &term);
    }
    fputs("\e[6n", stdout);
    fflush(stdout);
    while (!(i = kbhit())) {}
    ret = read(1, &buf, i);
    if (!textlock) tcsetattr(0, TCSANOW, &restore);
    if (!ret) return;
    sscanf(buf, "\e[%d;%dR", &cury, &curx);
    #else
    CONSOLE_SCREEN_BUFFER_INFO con;
    GetConsoleScreenBufferInfo(hConsole, &con);
    curx = con.dwCursorPosition.X + 1;
    cury = con.dwCursorPosition.Y + 1;
    #endif
}

void loadProg() {
    printf("Loading...");
    fflush(stdout);
    fseek(prog, 0, SEEK_END);
    printf("\b\b\b ");
    fflush(stdout);
    getCurPos();
    int tmpx = curx, tmpy = cury;
    uint64_t fsize = (uint64_t)ftell(prog);
    uint64_t time2 = usTime();
    fseek(prog, 0, SEEK_SET);
    #ifndef _WIN_NO_VT
    printf("\e[%d;%dH", tmpy, tmpx);
    #else
    SetConsoleCursorPosition(hConsole, (COORD){tmpx - 1, tmpy - 1});
    #endif
    printf("(%llu bytes)...", (long long unsigned)fsize);
    fflush(stdout);
    progbuf = realloc(progbuf, fsize + 1);
    int64_t j = 0;
    bool comment = false;
    bool inStr = false;
    #ifndef _WIN_NO_VT
    printf("\e[%d;%dH", tmpy, tmpx);
    #else
    SetConsoleCursorPosition(hConsole, (COORD){tmpx - 1, tmpy - 1});
    #endif
    printf("(0/%llu bytes)...", (long long unsigned)fsize);
    fflush(stdout);
    while (!feof(prog)) {
        int tmpc = fgetc(prog);
        if (tmpc == '"') inStr = !inStr;
        if (tmpc == '\'' && !inStr) comment = true;
        if (tmpc == '\n') comment = false;
        if (tmpc == '\r' || tmpc == '\t') tmpc = ' ';
        if (!comment) {progbuf[j] = (char)tmpc; j++;}
        if (usTime() - time2 >= 250000) {
            time2 = usTime();
            #ifndef _WIN_NO_VT
            printf("\e[%d;%dH", tmpy, tmpx);
            #else
            SetConsoleCursorPosition(hConsole, (COORD){tmpx - 1, tmpy - 1});
            #endif
            printf("(%lld/%lld bytes)...", (long long unsigned)ftell(prog), (long long unsigned)fsize);
        }
        fflush(stdout);
    }
    #ifndef _WIN_NO_VT
    printf("\e[%d;%dH", tmpy, tmpx);
    #else
    SetConsoleCursorPosition(hConsole, (COORD){tmpx - 1, tmpy - 1});
    #endif
    printf("(%lld/%lld bytes)...", (long long unsigned)ftell(prog), (long long unsigned)fsize);
    #ifndef _WIN_NO_VT
    fputs("\e[2K", stdout);
    fflush(stdout);
    #else
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    int ret = GetConsoleScreenBufferInfo(hConsole, &csbi);
    getCurPos();
    DWORD ret2;
    ret = FillConsoleOutputCharacter(hConsole, ' ', csbi.dwSize.X, (COORD){0, cury - 1}, &ret2);
    (void)ret;
    (void)ret2;
    #endif
    putchar('\r');
    fflush(stdout);
    if (j < 1) j = 1;
    progbuf[j - 1] = 0;
}

double randNum(double num1, double num2) {
    double range = num2 - num1;
    double div = RAND_MAX / range;
    return num1 + (rand() / div);
}

bool chkCmd(int ct, ...) {
    va_list args;
    va_start(args, ct);
    char* str0 = va_arg(args, char*);
    bool match = false;
    for (int i = 0; i < ct; i++) {
        char* str1 = str0;
        char* str2 = va_arg(args, char*);
        while (1) {
            if (!*str1 && !*str2) break;
            if (*str1 != *str2) goto nmatch;
            str1++;
            str2++;
        }
        match = true;
        nmatch:
        if (match) return true;
    }
    return false;
}

bool isSpChar(char bfr) {
    return (bfr == '+' || bfr == '-' || bfr == '*' || bfr == '/' || bfr == '^');
}

bool isValidVarChar(char bfr) {
    return ((bfr >= 'A' && bfr <= 'Z') || (bfr >= '0' && bfr <= '9')
    || (bfr >= '#' && bfr <= '&') || bfr == '!' || bfr == '?' || bfr == '@');
}

#ifndef BUILT_IN_STRING_FUNCS
void copyStr(char* str1, char* str2) {
    if (!str1) {str2[0] = 0; return;}
    int i;
    for (i = 0; str1[i]; i++) {str2[i] = str1[i];}
    str2[i] = 0;
}

void copyStrApnd(char* str1, char* str2) {
    if (!str1) {str2[0] = 0; return;}
    int j = 0, i = 0;
    for (i = strlen(str2); str1[j]; i++) {str2[i] = str1[j]; j++;}
    str2[i] = 0;
}
#endif

void copyStrSnip(char* str1, int i, int j, char* str2) {
    if (!str1) {str2[0] = 0; return;}
    int i2 = 0;
    for (int i3 = i; i3 < j; i3++) {str2[i2] = str1[i3]; i2++;}
    str2[i2] = 0;
}

void copyStrTo(char* str1, int i, char* str2) {
    if (!str1) {str2[0] = 0; return;}
    int i2 = 0;
    int i3;
    for (i3 = i; str1[i]; i++) {str2[i3] = str1[i2]; i2++; i3++;}
    str2[i3] = 0;
}

void strApndChar(char* str, char c) {
    int len = 0;
    while (str[len]) {len++;}
    str[len] = c;
    len++;
    str[len] = 0;
}

void upCase(char* str) {
    for (int i = 0; str[i]; i++) {
        if (str[i] >= 'a' && str[i] <= 'z') str[i] -= 32;
    }
}

void lowCase(char* str) {
    for (int i = 0; str[i]; i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') str[i] += 32;
    }
}

void updateTxtAttrib() {
    #ifndef _WIN_NO_VT
    fputs("\e[0m", stdout);
    if (txt_fgc) printf("\e[38;5;%um", fgc);
    if (txt_bgc) printf("\e[48;5;%um", bgc);
    if (txt_bold) fputs("\e[1m", stdout);
    if (txt_italic) fputs("\e[3m", stdout);
    if (txt_underln) fputs("\e[4m", stdout);
    if (txt_underlndbl) fputs("\e[21m", stdout);
    if (txt_underlnsqg) fputs("\e[4:3m", stdout);
    if (txt_strike) fputs("\e[9m", stdout);
    if (txt_overln) fputs("\e[53m", stdout);
    if (txt_dim) fputs("\e[2m", stdout);
    if (txt_blink) fputs("\e[5m", stdout);
    if (txt_hidden) fputs("\e[8m", stdout);
    if (txt_reverse) fputs("\e[7m", stdout);
    if (txt_underlncolor) printf("\e[58:5:%um", txt_underlncolor);
    #else
    uint8_t tfgc, tbgc;
    switch (fgc % 16) {
        case 1: tfgc = 4; break;
        case 3: tfgc = 6; break;
        case 4: tfgc = 1; break;
        case 6: tfgc = 3; break;
        case 9: tfgc = 12; break;
        case 11: tfgc = 14; break;
        case 12: tfgc = 9; break;
        case 14: tfgc = 11; break;
        default: tfgc = fgc; break;
    }
    switch (bgc % 16) {
        case 1: tbgc = 4; break;
        case 3: tbgc = 6; break;
        case 4: tbgc = 1; break;
        case 6: tbgc = 3; break;
        case 9: tbgc = 12; break;
        case 11: tbgc = 14; break;
        case 12: tbgc = 9; break;
        case 14: tbgc = 11; break;
        default: tbgc = bgc; break;
    }
	SetConsoleTextAttribute(hConsole, (tfgc % 16) + (tbgc % 16) * 16);
    #endif
    fflush(stdout);
}

char buf[CB_BUF_SIZE];

void getStr(char* str1, char* str2) {
    int j = 0, i;
    for (i = 0; str1[i]; i++) {
        char c = str1[i];
        if (c == '\\') {
            i++;
            char h[5];
            unsigned int tc = 0;
            switch (str1[i]) {
                case 'n': c = '\n'; break;
                case 'r': c = '\r'; break;
                case 'f': c = '\f'; break;
                case 't': c = '\t'; break;
                case 'v': c = '\v'; break;
                case 'b': c = '\b'; break;
                case 'e': c = '\e'; break;
                case 'x':
                    h[0] = '0';
                    h[1] = str1[i]; i++;
                    h[2] = str1[i]; i++;
                    h[3] = str1[i];
                    h[4] = 0;
                    sscanf(h, "%x", &tc);
                    c = (char)tc;
                    break;
                case '\\': c = '\\'; break;
                default: i--; break;
            }
        }
        buf[j] = c;
        j++;
    }
    buf[j] = 0;
    copyStr(buf, str2);
}

uint8_t getType(char* str) {
    if (str[0] == '"') {if (str[strlen(str) - 1] != '"') {return 0;} return 1;}
    bool p = false;
    for (int i = 0; str[i]; i++) {
        if (str[i] == '-') {} else
        if ((str[i] < '0' || str[i] > '9') && str[i] != '.') {return 255;} else
        if (str[i] == '.') {if (p) {return 0;} p = true;}
    }
    return 2;
}

int getArg(int num, char* inbuf, char* outbuf);
int getArgCt(char* inbuf);

uint8_t getFunc(char* inbuf, char* outbuf) {
    if (debug) printf("getFunc(\"%s\", \"%s\");\n", inbuf, outbuf);
    char** farg;
    uint8_t* fargt;
    int* flen;
    int fargct;
    int ftmpct = 0;
    int ftype = 0;
    char gftmp[2][CB_BUF_SIZE];
    int i;
    for (i = 0; inbuf[i] != '('; i++) {if (inbuf[i] >= 'a' && inbuf[i] <= 'z') inbuf[i] = inbuf[i] - 32;}
    copyStrSnip(inbuf, i + 1, strlen(inbuf) - 1, gftmp[0]);
    fargct = getArgCt(gftmp[0]);
    farg = malloc((fargct + 1) * sizeof(char*));
    flen = malloc((fargct + 1) * sizeof(int));
    fargt = malloc((fargct + 1) * sizeof(uint8_t));
    for (int j = 0; j <= fargct; j++) {
        if (j == 0) {
            flen[0] = i;
            farg[0] = (char*)malloc((flen[0] + 1) * sizeof(char));
            copyStrSnip(inbuf, 0, i, farg[0]);
        } else {
            getArg(j - 1, gftmp[0], gftmp[1]);
            fargt[j] = getVal(gftmp[1], gftmp[1]);
            if (fargt[j] == 0) goto fexit;
            if (fargt[j] == 255) fargt[j] = 0;
            flen[j] = strlen(gftmp[1]);
            farg[j] = (char*)malloc((flen[j] + 1) * sizeof(char));
            copyStr(gftmp[1], farg[j]);
            if (debug) printf("farg[%d]: {%s}\n", j, farg[j]);
            ftmpct++;
        }
    }
    outbuf[0] = 0;
    cerr = 127;
    errstr = realloc(errstr, (flen[0] + 1) * sizeof(char));
    copyStr(farg[0], errstr);
    #include "functions.c"
    fexit:
    for (int j = 0; j <= ftmpct; j++) {
        free(farg[j]);
    }
    free(farg);
    free(flen);
    free(fargt);
    if (debug) printf("output: getFunc(\"%s\", \"%s\");\n", inbuf, outbuf);
    if (cerr) return 0;
    return ftype;
}

uint8_t getVar(char* vn, char* varout) {
    if (debug) printf("getVar(\"%s\", \"%s\");\n", vn, varout);
    if (vn[0] == 0) return 0;
    int vnlen = strlen(vn);
    if (vn[vnlen - 1] == ')') {
        return getFunc(vn, varout);
    }
    upCase(vn);
    if (getType(vn) != 255) {
        cerr = 4;
        errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
        copyStr(vn, errstr);
        return 0;
    }
    for (register int i = 0; vn[i]; i++) {
        if (!isValidVarChar(vn[i])) {
            cerr = 4;
            errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
            copyStr(vn, errstr);
            return 0;
        }
    }
    int v = -1;
    if (debug) printf("varmaxct: [%d]\n", varmaxct);
    for (register int i = 0; i < varmaxct; i++) {
        if (debug) printf("varname[%d]: {%s}\n", i, varname[i]);
        if (varinuse[i]) {if (!strcmp(vn, varname[i])) {v = i; break;}}
    }
    if (debug) printf("getVar: v: [%d]\n", v);
    if (v == -1) {
        if (vn[vnlen - 1] == '$') {varout[0] = 0; return 1;}
        else {varout[0] = '0'; varout[1] = 0; return 2;}
    } else {
        copyStr(varstr[v], varout);
        if (debug) printf("varout: {%s}\n", varout);
        return vartype[v];
    }
    return 0;
}

bool setVar(char* vn, char* val, uint8_t t) {
    if (debug) printf("setVar(\"%s\", \"%s\", %d);\n", vn, val, (int)t);
    upCase(vn);
    int vnlen = strlen(vn);
    if (getType(vn) != 255) {
        cerr = 4;
        errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
        copyStr(vn, errstr);
        return false;
    }
    for (register int i = 0; vn[i]; i++) {
        if (!isValidVarChar(vn[i])) {
            cerr = 4;
            errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
            copyStr(vn, errstr);
            return false;
        }
    }
    int v = -1;
    for (register int i = 0; i < varmaxct; i++) {
        if (!strcmp(vn, varname[i])) {v = i; break;}
    }
    if (v == -1) {
        bool incmaxct = true;
        for (register int i = 0; i < varmaxct; i++) {
            if (!varinuse[i]) {v = i; incmaxct = false; break;}
        }
        if (v == -1) v = varmaxct;
        varstr = realloc(varstr, (v + 1) * sizeof(char*));
        varname = realloc(varname, (v + 1) * sizeof(char*));
        varlen = realloc(varlen, (v + 1) * sizeof(int));
        varinuse = (bool*)realloc(varinuse, (v + 1) * sizeof(bool));
        varinuse[v] = true;
        vartype = (uint8_t*)realloc(vartype, (v + 1) * sizeof(uint8_t));
        varlen[v] = strlen(val);
        varstr[v] = (char*)malloc((varlen[v] + 1) * sizeof(char));
        varname[v] = (char*)malloc((vnlen + 1) * sizeof(char));
        copyStr(vn, varname[v]);
        copyStr(val, varstr[v]);
        vartype[v] = t;
        if (incmaxct) varmaxct++;
    } else {
        if (t != vartype[v]) {cerr = 2; return false;}
        varlen[v] = strlen(val);
        varstr[v] = (char*)realloc(varstr[v], (varlen[v] + 1) * sizeof(char));
        copyStr(val, varstr[v]);
    }
    return true;
}

bool delVar(char* vn) {
    if (debug) printf("delVar(\"%s\");\n", vn);
    upCase(vn);
    int vnlen = strlen(vn);
    for (register int i = 0; vn[i]; i++) {
        if (!isValidVarChar(vn[i])) {
            cerr = 4;
            errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
            copyStr(vn, errstr);
            return false;
        }
    }
    if (getType(vn) != 255) {
        cerr = 4;
        errstr = realloc(errstr, (vnlen + 1) * sizeof(char));
        copyStr(vn, errstr);
        return false;
    }
    int v = -1;
    for (register int i = 0; i < varmaxct; i++) {
        if (!strcmp(vn, varname[i])) {v = i; break;}
    }
    if (v != -1) {
        varinuse[v] = false;
        free(varstr[v]);
        free(varname[v]);
        if (v == varmaxct - 1) {
            while (!varinuse[v] && v >= 0) {varmaxct--; v--;}
            varstr = realloc(varstr, (v + 1) * sizeof(char*));
            varname = realloc(varname, (v + 1) * sizeof(char*));
            varlen = realloc(varlen, (v + 1) * sizeof(int));
            varinuse = (bool*)realloc(varinuse, (v + 1) * sizeof(bool));
            vartype = (uint8_t*)realloc(vartype, (v + 1) * sizeof(uint8_t));
        }
    }
    return true;
}

bool gvchkchar(char* tmp, int i) {
    if (isSpChar(tmp[i + 1])) {
        if (tmp[i + 1] == '-') {
            if (isSpChar(tmp[i + 2])) {
                cerr = 1; return false;
            }
        } else {
            cerr = 1; return false;
        }
    } else {
        if (isSpChar(tmp[i - 1])) {
            cerr = 1; return false;
        }
    }
    return true;
}

uint8_t getVal(char* inbuf, char* outbuf) {
    if (debug) printf("getVal(\"%s\", \"\");\n", inbuf);
    if (inbuf[0] == 0) {return 255;}
    char* tmp[4] = {malloc(CB_BUF_SIZE), malloc(CB_BUF_SIZE), malloc(CB_BUF_SIZE), malloc(CB_BUF_SIZE)};
    int ip = 0, jp = 0;
    uint8_t t = 0;
    uint8_t dt = 0;
    bool inStr = false;
    register double num1 = 0;
    register double num2 = 0;
    register double num3 = 0;
    int numAct;
    if ((isSpChar(inbuf[0]) && inbuf[0] != '-') || isSpChar(inbuf[strlen(inbuf) - 1])) {cerr = 1; dt = 0; goto gvreturn;}
    int tmpct = 0;
    tmp[0][0] = 0; tmp[1][0] = 0; tmp[2][0] = 0; tmp[3][0] = '"'; tmp[3][1] = 0;
    bool* tmpSeenStr = malloc(sizeof(bool));
    tmpSeenStr[0] = false;
    for (int i = 0; inbuf[i]; i++) {
        if (inbuf[i] == '"') {
            inStr = !inStr;
            if (inStr && tmpSeenStr[tmpct]) {
                free(tmpSeenStr);
                dt = 0;
                cerr = 1;
                goto gvreturn;
            }
            tmpSeenStr[tmpct] = true;
        }
        if (isSpChar(inbuf[i]) && !inStr) tmpSeenStr[tmpct] = false;
        if (inbuf[i] == '(' && !inStr) {
            if (tmpct == 0) {ip = i;}
            tmpct++;
            tmpSeenStr = realloc(tmpSeenStr, (tmpct + 1) * sizeof(bool));
            tmpSeenStr[tmpct] = false;
        }
        if (inbuf[i] == ')' && !inStr) {
            tmpct--;
            tmpSeenStr = realloc(tmpSeenStr, (tmpct + 1) * sizeof(bool));
            if (tmpct == 0 && (ip == 0 || isSpChar(inbuf[ip - 1]))) {
                int tmplen[2];
                tmplen[0] = strlen(inbuf);
                jp = i;
                copyStrSnip(inbuf, ip + 1, jp, tmp[0]);
                t = getVal(tmp[0], tmp[0]);
                if (t == 0) {dt = 0; goto gvreturn;}
                if (dt == 0) dt = t;
                if (t == 255) {t = 1; dt = 1;}
                if (t != dt) {cerr = 2; dt = 0; goto gvreturn;}
                copyStrSnip(inbuf, 0, ip, tmp[1]);
                copyStrApnd(tmp[1], tmp[2]);    
                if (t == 1) copyStrApnd(tmp[3], tmp[2]);
                copyStrApnd(tmp[0], tmp[2]);
                if (t == 1) copyStrApnd(tmp[3], tmp[2]);
                copyStrSnip(inbuf, jp + 1, strlen(inbuf), tmp[1]);
                copyStrApnd(tmp[1], tmp[2]);
                copyStr(tmp[2], inbuf);
                tmp[0][0] = 0; tmp[1][0] = 0; tmp[2][0] = 0; tmp[3][0] = 0;
                tmplen[1] = strlen(inbuf);
                i -= tmplen[0] - tmplen[1];
            }
        }
    }
    if (tmpct) {cerr = 1; dt = 0; goto gvreturn;}
    ip = 0; jp = 0;
    tmp[0][0] = 0; tmp[1][0] = 0; tmp[2][0] = 0; tmp[3][0] = 0;
    while (1) {
        int pct = 0;
        while (1) {
            if (inbuf[jp] == '"') inStr = !inStr;
            if (inbuf[jp] == '(') pct++;
            if (inbuf[jp] == ')') pct--;
            if ((isSpChar(inbuf[jp]) && !inStr && pct == 0) || inbuf[jp] == 0) break;
            jp++;
        }
        if (inStr) {dt = 0; cerr = 1; goto gvreturn;}
        copyStrSnip(inbuf, ip, jp, tmp[0]);
        t = getType(tmp[0]);
        if (t == 1) getStr(tmp[0], tmp[0]);
        if (t == 255) {
            t = getVar(tmp[0], tmp[0]);
            if (t == 0) {dt = 0; dt = 0; goto gvreturn;}
            if (t == 1) {
                tmp[2][0] = '"'; tmp[2][1] = 0;
                copyStr(tmp[0], tmp[3]);
                copyStr(tmp[2], tmp[0]);
                copyStrApnd(tmp[3], tmp[0]);
                copyStrApnd(tmp[2], tmp[0]);
            }
        }
        if (t && dt == 0) {dt = t;} else
        if ((t && t != dt)) {cerr = 2; dt = 0; goto gvreturn;} else
        if (t == 0) {cerr = 1; dt = 0; goto gvreturn;}
        if ((dt == 1 && inbuf[jp] != '+') && inbuf[jp]) {cerr = 1; dt = 0; goto gvreturn;}
        if (t == 1) {copyStrSnip(tmp[0], 1, strlen(tmp[0]) - 1, tmp[2]); copyStrApnd(tmp[2], tmp[1]);} else
        if (t == 2) {
            copyStrSnip(inbuf, jp, strlen(inbuf), tmp[1]);
            copyStrApnd(tmp[1], tmp[0]);
            register int p1, p2, p3;
            bool inStr = false;
            pct = 0;
            while (true) {
                numAct = 0;
                p1 = 0, p2 = 0, p3 = 0;
                for (register int i = 0; tmp[0][i] && p2 == 0; i++) {
                    if (tmp[0][i] == '"') inStr = !inStr;
                    if (tmp[0][i] == '(') {pct++;}
                    if (tmp[0][i] == ')') {pct--;}
                    if (tmp[0][i] == '^' && !inStr && !pct) {if (!gvchkchar(tmp[0], i)) {dt = 0; goto gvreturn;} p2 = i; numAct = 4;}
                }
                for (register int i = 0; tmp[0][i] && p2 == 0; i++) {
                    if (tmp[0][i] == '"') inStr = !inStr;
                    if (tmp[0][i] == '(') {pct++;}
                    if (tmp[0][i] == ')') {pct--;}
                    if (tmp[0][i] == '*' && !inStr && !pct) {if (!gvchkchar(tmp[0], i)) {dt = 0; goto gvreturn;} p2 = i; numAct = 2;}
                    if (tmp[0][i] == '/' && !inStr && !pct) {if (!gvchkchar(tmp[0], i)) {dt = 0; goto gvreturn;} p2 = i; numAct = 3;}
                }
                for (register int i = 0; tmp[0][i] && p2 == 0; i++) {
                    if (tmp[0][i] == '"') inStr = !inStr;
                    if (tmp[0][i] == '(') {pct++;}
                    if (tmp[0][i] == ')') {pct--;}
                    if (tmp[0][i] == '+' && !inStr && !pct) {if (!gvchkchar(tmp[0], i)) {dt = 0; goto gvreturn;} p2 = i; numAct = 0;}
                    if (tmp[0][i] == '-' && !inStr && !pct) {if (!gvchkchar(tmp[0], i)) {dt = 0; goto gvreturn;} p2 = i; numAct = 1;}
                }
                inStr = false;
                pct = 0;
                if (debug) printf("getVal: tmp[0]: {%s}, tmp[1]: {%s}, tmp[2]: {%s}, tmp[3]: {%s}\n", tmp[0], tmp[1], tmp[2], tmp[3]);
                if (p2 == 0) {
                    if (p3 == 0) {
                        t = getType(tmp[0]);
                        if (t == 0) {cerr = 1; dt = 0; goto gvreturn;} else
                        if (t == 255) {t = getVar(tmp[0], tmp[0]);
                        if (t == 0) {dt = 0; goto gvreturn;}
                        if (t == 255) {t = 2; tmp[0][0] = '0'; tmp[0][1] = 0;}
                        if (t != 2) {cerr = 2; dt = 0; goto gvreturn;}}
                    }
                    copyStr(tmp[0], tmp[1]); goto gvfexit;
                }
                tmp[1][0] = 0; tmp[2][0] = 0; tmp[3][0] = 0;
                for (register int i = p2 - 1; i > 0; i--) {
                    if (tmp[0][i] == '"') inStr = !inStr;
                    if (tmp[0][i] == '(') {pct++;}
                    if (tmp[0][i] == ')') {pct--;}
                    if (isSpChar(tmp[0][i]) && !inStr && !pct) {p1 = i; break;}
                }
                for (register int i = p2 + 1; true; i++) {
                    if (tmp[0][i] == '"') inStr = !inStr;
                    if (tmp[0][i] == '(') {pct++;}
                    if (tmp[0][i] == ')') {pct--;}
                    if ((isSpChar(tmp[0][i]) && i != p2 + 1 && !inStr && !pct) || tmp[0][i] == 0) {p3 = i; break;}
                }
                if (tmp[0][p1] == '+') p1++;
                copyStrSnip(tmp[0], p1, p2, tmp[2]);
                t = getType(tmp[2]);
                if (t == 0) {cerr = 1; dt = 0; goto gvreturn;} else
                if (t == 255) {t = getVar(tmp[2], tmp[2]); if (t == 0) {dt = 0; goto gvreturn;} if (t != 2) {cerr = 2; dt = 0; goto gvreturn;}}
                copyStrSnip(tmp[0], p2 + 1, p3, tmp[3]);
                t = getType(tmp[3]);
                if (t == 0) {cerr = 1; dt = 0; goto gvreturn;} else
                if (t == 255) {t = getVar(tmp[3], tmp[3]); if (t == 0) {dt = 0; goto gvreturn;} if (t != 2) {cerr = 2; dt = 0; goto gvreturn;}}
                if (debug) printf("getVal: p1: [%d], p2: [%d], p3: [%d]\n", p1, p2, p3);
                if (debug) printf("getVal: tmp[0]: {%s}, tmp[1]: {%s}, tmp[2]: {%s}, tmp[3]: {%s}\n", tmp[0], tmp[1], tmp[2], tmp[3]);
                if (!strcmp(tmp[2], ".")) {cerr = 1; dt = 0; goto gvreturn;}
                num1 = atof(tmp[2]);
                if (!strcmp(tmp[2], ".")) {cerr = 1; dt = 0; goto gvreturn;}
                num2 = atof(tmp[3]);
                if (debug) printf("num1: [%lf], num2: [%lf], num3: [%lf]\n", num1, num2, num3);
                switch (numAct) {
                    case 0: num3 = num1 + num2; break;
                    case 1: num3 = num1 - num2; break;
                    case 2: num3 = num1 * num2; break;
                    case 3: if (num2 == 0) {cerr = 5; dt = 0; goto gvreturn;} num3 = num1 / num2; break;
                    case 4:
                        if (num1 == 0) {if (num2 == 0) {cerr = 5; dt = 0; goto gvreturn;} num3 = 0; break;}
                        if (num2 == 0) {num3 = 1; break;}
                        num3 = pow(num1, num2);
                        if (num1 < 0 && num3 > 0) {num3 *= -1;}
                        break;
                }
                if (debug) printf("num1: [%lf], num2: [%lf], num3: [%lf]\n", num1, num2, num3);
                tmp[1][0] = 0;
                sprintf(tmp[2], "%lf", num3);
                if (debug) printf("getVal: tmp[0]: {%s}, tmp[1]: {%s}, tmp[2]: {%s}, tmp[3]: {%s}\n", tmp[0], tmp[1], tmp[2], tmp[3]);
                int i = 0;
                while (tmp[2][i] == '0') i++;
                copyStrSnip(tmp[2], i, strlen(tmp[2]), tmp[2]);
                copyStrSnip(tmp[0], p3, strlen(tmp[0]), tmp[3]);
                if (p1) copyStrSnip(tmp[0], 0, p1, tmp[1]);
                copyStrApnd(tmp[2], tmp[1]);
                copyStrApnd(tmp[3], tmp[1]);
                copyStr(tmp[1], tmp[0]);
            }
        }
        if (inbuf[jp] == 0) {break;}
        jp++;
        ip = jp;
    }
    gvfexit:
    if (dt == 2) {
        if (tmp[1][0] == '.' && !tmp[1][1]) {cerr = 1; dt = 0; goto gvreturn;}
        int i = 0, j = strlen(tmp[1]);
        bool dp = false;
        while (tmp[1][i]) {if (tmp[1][i] == '.') {tmp[1][i + 7] = 0; dp = true; break;} i++;}
        i = 0;
        while (tmp[1][i] == '0') i++;
        if (dp) {
            j--;
            while (tmp[1][j] == '0') {j--;}
            if (tmp[1][j] == '.') {j--;}
            j++;
        }
        outbuf[0] = 0;
        copyStrSnip(tmp[1], i, j, tmp[2]);
        if (tmp[1][i] == '.') strcpy(outbuf, "0");
        copyStrApnd(tmp[2], outbuf);
    } else {
        copyStr(tmp[1], outbuf);
    }
    if (outbuf[0] == 0 && dt != 1) {outbuf[0] = '0'; outbuf[1] = 0; dt = 2;}
    if (debug) printf("output: getVal(\"%s\", \"%s\");\n", inbuf, outbuf);
    gvreturn:
    free(tmp[0]); free(tmp[1]); free(tmp[2]); free(tmp[3]);
    return dt;
}

char satmpbuf[CB_BUF_SIZE];

bool solvearg(int i) {
    if (i == 0) {
        argt[0] = 0;
        arg[0] = tmpargs[0];
        argl[0] = strlen(arg[0]);
        return true;
    }
    argt[i] = 0;
    satmpbuf[0] = 0;
    argt[i] = getVal(tmpargs[i], satmpbuf);
    arg[i] = realloc(arg[i], (strlen(satmpbuf) + 1) * sizeof(char));
    copyStr(satmpbuf, arg[i]);
    argl[i] = strlen(arg[i]);
    if (argt[i] == 0) return false;
    if (argt[i] == 255) {argt[i] = 0;}
    return true;
}

int getArgCt(char* inbuf) {
    int ct = 0;
    bool inStr = false;
    int pct = 0;
    int j = 0;
    while (inbuf[j] == ' ') {j++;}
    for (int i = j; inbuf[i]; i++) {
        if (ct == 0) ct = 1;
        if (inbuf[i] == '(' && !inStr) {pct++;}
        if (inbuf[i] == ')' && !inStr) {pct--;}
        if (inbuf[i] == '"') inStr = !inStr;
        if (inbuf[i] == ',' && !inStr && pct == 0) ct++;
    }
    return ct;
}

int getArg(int num, char* inbuf, char* outbuf) {
    bool inStr = false;
    int pct = 0;
    int ct = 0;
    int len = 0;
    for (int i = 0; inbuf[i] && ct <= num; i++) {
        if (inbuf[i] == '(' && !inStr) {pct++;}
        if (inbuf[i] == ')' && !inStr) {pct--;}
        if (inbuf[i] == '"') {inStr = !inStr;}
        if (inbuf[i] == ' ' && !inStr) {} else
        if (inbuf[i] == ',' && !inStr && pct == 0) {ct++;} else
        if (ct == num) {outbuf[len] = inbuf[i]; len++;}
    }
    outbuf[len] = 0;
    return len;
}

char tmpbuf[2][CB_BUF_SIZE];

void mkargs() {
    int j = 0;
    while (cmd[j] == ' ') {j++;}
    int h = j;
    while (cmd[h] != ' ' && cmd[h] != '=' && cmd[h]) {h++;}
    copyStrSnip(cmd, h + 1, strlen(cmd), tmpbuf[0]);
    int tmph = h;
    while (cmd[tmph] == ' ' && cmd[tmph]) {tmph++;}
    if (cmd[tmph] == '=') {
        strcpy(tmpbuf[1], "SET ");
        cmd[tmph] = ',';
        copyStrApnd(cmd, tmpbuf[1]);
        cmd = realloc(cmd, (strlen(tmpbuf[1]) + 1) * sizeof(char));
        copyStr(tmpbuf[1], cmd);
        copyStr(tmpbuf[1], tmpbuf[0]);
        tmpbuf[1][0] = 0;
        h = 3;
        j = 0;
    }
    if (debug) printf("cmd: {%s}\n", cmd);
    if (debug) printf("tmpbuf[0]: {%s}\n", tmpbuf[0]);
    if (debug) printf("tmpbuf[1]: {%s}\n", tmpbuf[1]);
    argct = getArgCt(tmpbuf[0]);
    tmpargs = realloc(tmpargs, (argct + 1) * sizeof(char*));
    argl = realloc(argl, (argct + 1) * sizeof(int));
    for (int i = 0; i <= argct; i++) {
        argl[i] = 0;
        if (i == 0) {
            copyStrSnip(cmd, j, h, tmpbuf[0]);
            argl[i] = strlen(tmpbuf[0]);
            tmpargs[i] = malloc((argl[i] + 1) * sizeof(char));
            copyStr(tmpbuf[0], tmpargs[i]);            
            copyStrSnip(cmd, h + 1, strlen(cmd), tmpbuf[0]);
        } else {
            argl[i] = getArg(i - 1, tmpbuf[0], tmpbuf[1]);
            tmpargs[i] = malloc((argl[i] + 1) * sizeof(char));
            copyStr(tmpbuf[1], tmpargs[i]);
        }
        if (debug) printf("length of arg[%d]: %d\n", i, argl[i]);
        tmpargs[i][argl[i]] = 0;
    }
    if (argct == 1 && tmpargs[1][0] == 0) {argct = 0;}
    for (int i = 0; i <= argct; i++) {tmpargs[i][argl[i]] = 0;}
}

char lttmp[3][CB_BUF_SIZE];

uint8_t logictest(char* inbuf) {
    if (debug) printf("logictest(\"%s\");\n", inbuf);
    int tmpp = 0;
    uint8_t t1 = 0;
    uint8_t t2 = 0;
    int p = 0;
    bool inStr = false;
    int pct = 0;
    while (inbuf[p] == ' ') {p++;}
    if (p >= (int)strlen(inbuf)) {cerr = 10; return -1;}
    for (int i = p; true; i++) {
        if (inbuf[i] == '(' && !inStr) {pct++;}
        if (inbuf[i] == ')' && !inStr) {pct--;}
        if (inbuf[i] == '"') {inStr = !inStr;}  
        if (inbuf[i] == 0) {cerr = 1; return -1;}
        if ((inbuf[i] == '<' || inbuf[i] == '=' || inbuf[i] == '>') && !inStr && pct == 0) {p = i; break;}
        if (inbuf[i] == ' ' && !inStr) {} else
        {lttmp[0][tmpp] = inbuf[i]; tmpp++;}
    }
    lttmp[0][tmpp] = 0;
    tmpp = 0;
    for (int i = p; true; i++) {
        if (tmpp > 2) {cerr = 1; return -1;}
        if (inbuf[i] != '<' && inbuf[i] != '=' && inbuf[i] != '>') {p = i; break;} else
        {lttmp[1][tmpp] = inbuf[i]; tmpp++;}
    }
    lttmp[1][tmpp] = 0;
    tmpp = 0;
    for (int i = p; true; i++) {
        if (inbuf[i] == 0) {break;}
        if (inbuf[i] == ' ' && !inStr) {} else
        {lttmp[2][tmpp] = inbuf[i]; tmpp++;}
    }
    lttmp[2][tmpp] = 0;
    if (debug) printf("getting lttmp[0]... current: {%s}\n", lttmp[0]);
    t1 = getVal(lttmp[0], lttmp[0]);
    if (debug) printf("DONE: {%s}\n", lttmp[0]);
    if (t1 == 0) return -1;
    if (debug) printf("getting lttmp[2]... current: {%s}\n", lttmp[2]);
    t2 = getVal(lttmp[2], lttmp[2]);
    if (debug) printf("DONE: {%s}\n", lttmp[2]);
    if (t2 == 0) return -1;
    if (t1 != t2) {cerr = 2; return -1;}
    if (!strcmp(lttmp[1], "=")) {
        return (uint8_t)(bool)!strcmp(lttmp[0], lttmp[2]);
    } else if (!strcmp(lttmp[1], "<>")) {
        return (uint8_t)(bool)strcmp(lttmp[0], lttmp[2]);
    } else if (!strcmp(lttmp[1], ">")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 > num2;
    } else if (!strcmp(lttmp[1], "<")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 < num2;
    } else if (!strcmp(lttmp[1], ">=")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 >= num2;
    } else if (!strcmp(lttmp[1], "<=")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 <= num2;
    } else if (!strcmp(lttmp[1], "=>")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 >= num2;
    } else if (!strcmp(lttmp[1], "=<")) {
        if (t1 == 1) {cerr = 2; return -1;}
        double num1, num2;
        sscanf(lttmp[0], "%lf", &num1);
        sscanf(lttmp[2], "%lf", &num2);
        return num1 <= num2;
    }
    cerr = 1;
    return -1;
}

char ltmp[2][CB_BUF_SIZE];

bool runlogic() {
    ltmp[0][0] = ltmp[1][0] = 0;
    int i = 0;
    while (cmd[i] == ' ') {i++;}
    int j = i;
    while (cmd[j] != ' ' && cmd[j]) {j++;}
    copyStrSnip(cmd, i, j, ltmp[0]);
    upCase(ltmp[0]);
    cerr = 0;
    #include "logic.c"
    return false;
}

void runcmd() {
    if (cmd[0] == 0) return;
    cerr = 0;
    if (debug) printf("testing logic...\n");
    bool lgc = runlogic();
    if (lgc) {if (debug) printf("tested logic.\n"); goto cmderr;}
    if (dlstackp > -1) {if (dldcmd[dlstackp]) return;}
    if (itstackp > -1) {if (itdcmd[itstackp]) return;}
    if (fnstackp > -1) {if (fndcmd[fnstackp]) return;}
    if (debug) printf("passed\n");
    if (debug) printf("making args...\n");
    mkargs();
    argt = realloc(argt, argct + 1);
    arg = realloc(arg, (argct + 1) * sizeof(char*));
    for (int i = 1; i <= argct; i++) {arg[i] = NULL;}
    if (debug) printf("running command...\n");
    solvearg(0);
    upCase(arg[0]);
    if (debug) printf("C [%d]: {%s}\n", 0, arg[0]);
    cerr = 255;
    #include "commands.c"
    if (debug) printf("no error\n");
    cmderr:
    if (debug) printf("cerr: [%d]\n", cerr);
    if (cerr) {
        getCurPos();
        if (curx != 1) printf("\n");
        if (inProg) {printf("Error %d on line %d of %s: '%s': ", cerr, progLine, progFilename, cmd);}
        else {printf("Error %d: ", cerr);}
        switch (cerr) {
            default:
                fputs("\b\b \b", stdout);
                break;
            case 1:
                fputs("Syntax", stdout);
                break;
            case 2:
                fputs("Type mismatch", stdout);
                break;
            case 3:
                fputs("Agument count mismatch", stdout);
                break;
            case 4:
                printf("Invalid variable name: '%s'", errstr);
                break;
            case 5:
                fputs("Operation results in undefined", stdout);
                break;
            case 6:
                fputs("LOOP without DO", stdout);
                break;
            case 7:
                fputs("ENDIF without IF", stdout);
                break;
            case 8:
                fputs("ELSE without IF", stdout);
                break;
            case 9:
                fputs("NEXT without FOR", stdout);
                break;
            case 10:
                fputs("Expected expression", stdout);
                break;
            case 11:
                fputs("Unexpected ELSE", stdout);
                break;
            case 12:
                fputs("Reached DO limit", stdout);
                break;
            case 13:
                fputs("Reached IF limit", stdout);
                break;
            case 14:
                fputs("Reached FOR limit", stdout);
                break;
            case 15:
                printf("File not found: '%s'", errstr);
                break;
            case 16:
                fputs("Invalid data or data range exceeded", stdout);
                break;
            case 17:
                printf("Cannot change to directory '%s'", errstr);
                break;
            case 18:
                fputs("Expected file instead of directory.", stdout);
                break;
            case 19:
                fputs("Expected directory instead of file.", stdout);
                break;
            case 20:
                fputs("File or directory error.", stdout);
                break;
            case 21:
                printf("Permission error: '%s'", errstr);
                break;
            case 127:
                printf("Not a function: '%s'", errstr);
                break;
            case 253:
                printf("Command not valid in command-line: '%s'", arg[0]);
                break;
            case 254:
                printf("Command not valid in program: '%s'", arg[0]);
                break;
            case 255:
                printf("Not a command: '%s'", arg[0]);
                break;
        }
        putchar('\n');
        cp = -1;
        chkinProg = inProg = false;
    }
    noerr:
    if (lgc) return;
    if (debug) printf("freeing stuff...\n");
    for (int i = 0; i <= argct; i++) {
        free(tmpargs[i]);
    }
    for (int i = 1; i <= argct; i++) {
        free(arg[i]);
    }
    return;
}

