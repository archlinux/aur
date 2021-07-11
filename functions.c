if (chkCmd(1, farg[0], "CHR$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    outbuf[0] = (char)atoi(farg[1]);
    outbuf[1] = 0;
    goto fexit;
}
if (chkCmd(1, farg[0], "ASC")) {
    cerr = 0;
    ftype = 2;
    int pos = 0;
    if (fargct != 1 && fargct != 2) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    if (fargct == 2) {
        if (fargt[2] != 2) {cerr = 2; goto fexit;}
        pos = (int)atoi(farg[2]);
        if (pos < 0) {cerr = 16; goto fexit;}
        if (pos > (int)strlen(farg[1])) pos = strlen(farg[1]);
    }
    sprintf(outbuf, "%d", farg[1][pos]);
    goto fexit;
}
if (chkCmd(2, farg[0], "RND", "RAND")) {
    cerr = 0;
    ftype = 2;
    double min = 0;
    double max;
    if (fargct == 1) {
        if (fargt[1] != 2) {cerr = 2; goto fexit;}
        sscanf(farg[1], "%lf", &max);
    } else if (fargct == 2) {
        if (fargt[1] + fargt[2] != 4) {cerr = 2; goto fexit;}
        sscanf(farg[1], "%lf", &min);
        sscanf(farg[2], "%lf", &max);
    } else {
        cerr = 3;
        goto fexit;
    }
    sprintf(outbuf, "%lf", randNum(min, max));
    if (debug) printf("1: outbuf: {%s}\n", outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "TIMERUS")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)timer());
    goto fexit;
}
if (chkCmd(1, farg[0], "TIMERMS")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)timer() / 1000);
    goto fexit;
}
if (chkCmd(1, farg[0], "TIMER")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)timer() / 1000000);
    goto fexit;
}
if (chkCmd(1, farg[0], "TIMEUS")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)usTime());
    goto fexit;
}
if (chkCmd(1, farg[0], "TIMEMS")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)usTime() / 1000);
    goto fexit;
}
if (chkCmd(1, farg[0], "TIME")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;} 
    sprintf(outbuf, "%llu", (long long unsigned)usTime() / 1000000);
    goto fexit;
}
if (chkCmd(2, farg[0], "SH", "EXEC")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;} 
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    #ifndef _WIN_NO_VT
    if (sh_clearAttrib) fputs("\e[0m", stdout);
    #endif
    #ifndef _WIN32
    if (sh_silent) {farg[1] = realloc(farg[1], sizeof(farg[1]) + 13); copyStrApnd(farg[1], " &>/dev/null");}
    #else
    if (sh_silent) {farg[1] = realloc(farg[1], sizeof(farg[1]) + 13); copyStrApnd(farg[1], " 1>nul 2>nul");}
    #endif
    sprintf(outbuf, "%d", system(farg[1]));
    if (sh_restoreAttrib) updateTxtAttrib();
    goto fexit;
}
if (chkCmd(1, farg[0], "CINT")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    //double dbl;
    if (debug) printf("farg[1]: {%s}\n", farg[1]);
    //sscanf(farg[1], "%lf", &dbl);
    //dbl = round(dbl);
    sprintf(outbuf, "%d", (int)round(atof(farg[1])));
    if (debug) printf("outbuf: {%s}\n", outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "INT")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%d", (int)dbl);
    int i;
    for (i = 0; outbuf[i] != '.' && outbuf[i]; i++) {}
    outbuf[i] = 0;
    goto fexit;
}
if (chkCmd(1, farg[0], "VAL")) {
    cerr = 0;
    ftype = 2;
    if (fargct < 1 || fargct > 2) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    if (fargct == 2 && fargt[2] != 2) {cerr = 2; goto fexit;}
    double dbl;
    if (fargct == 1) {
        sscanf(farg[1], "%lf", &dbl);
        sprintf(outbuf, "%lf", dbl);
        goto fexit;
    }
    int act = 0;
    uint64_t num;
    char* tmpstr = NULL;
    int tmplen = 0;
    int tmppos = 0;
    if (fargct == 2) act = atoi(farg[2]);
    switch (act) {
        case 0:
            tmplen = strlen(farg[1]);
            for (int i = 0; farg[1][i] == '0' && i < tmplen; i++) {
                tmppos++;
            }
            tmpstr = (char*)malloc(tmplen - tmppos + 1);
            copyStrSnip(farg[1], tmppos, tmplen, tmpstr);
            if (getType(farg[1]) != 2) {
                outbuf[0] = '0';
                outbuf[1] = 0;
                break;
            }
            sscanf(tmpstr, "%lf", &dbl);
            free(tmpstr);
            sprintf(outbuf, "%lf", dbl);
            break;
        case 1:
            sscanf(farg[1], "%llx", (long long unsigned int*)&num);
            sprintf(outbuf, "%llu", (long long unsigned int)num);
            break;
        case 2:
            sscanf(farg[1], "%llo", (long long unsigned int*)&num);
            sprintf(outbuf, "%llu", (long long unsigned int)num);
            break;
        default:
            sscanf(farg[1], "%lf", &dbl);
            sprintf(outbuf, "%lf", dbl);
            break;
    }
    goto fexit;
}
if (chkCmd(1, farg[0], "STR$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    copyStr(farg[1], outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "MOD")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 2) {cerr = 3; goto fexit;}
    if (fargt[1] != 2 || fargt[2] != 2) {cerr = 2; goto fexit;}
    double dbl1, dbl2;
    sscanf(farg[1], "%lf", &dbl1);
    sscanf(farg[2], "%lf", &dbl2);
    sprintf(outbuf, "%lf", fmod(dbl1, dbl2));
    goto fexit;
}
if (chkCmd(1, farg[0], "PI")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    strcpy(outbuf, "3.141593");
    goto fexit;
}
if (chkCmd(1, farg[0], "SIN")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", sin(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "COS")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", cos(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "TAN")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", tan(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "SINH")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", sinh(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "COSH")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", cosh(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "TANH")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", tanh(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "LOG")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", log(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "LOG10")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", log10(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "EXP")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%lf", exp(dbl));
    goto fexit;
}
if (chkCmd(1, farg[0], "UCASE$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    upCase(farg[1]);
    copyStr(farg[1], outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "LCASE$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    lowCase(farg[1]);
    copyStr(farg[1], outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "LEN")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    sprintf(outbuf, "%lu", (long unsigned)strlen(farg[1]));
    goto fexit;
}
if (chkCmd(1, farg[0], "INKEY$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    #ifndef _WIN32
    int tmp;
    if (!(tmp = kbhit())) goto fexit;
    int obp = 0;
    while (obp < tmp) {
        outbuf[obp] = 0;
        outbuf[obp] = getchar();
        if (outbuf[obp] == 0) {break;}
        obp++;
    }
    outbuf[obp] = 0;
    #else
    int tmp = 1;
    //if (!(tmp = strlen(inbuf) + 1)) goto fexit;
    int obp = 0;
    while (obp < tmp) {
        outbuf[obp] = 0;
        outbuf[obp] = kbinbuf[obp];
        kbinbuf[obp] = 0;
        if (outbuf[obp] == 0) {break;}
        obp++;
    }
    outbuf[obp] = 0;
    #endif
    goto fexit;
}
if (chkCmd(1, farg[0], "CURX")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    getCurPos();
    sprintf(outbuf, "%d", curx);
    goto fexit;
}
if (chkCmd(1, farg[0], "CURY")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    getCurPos();
    sprintf(outbuf, "%d", cury);
    goto fexit;
}
if (chkCmd(1, farg[0], "WIDTH")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    #ifdef __unix__
    struct winsize max;
    ioctl(0, TIOCGWINSZ , &max);
    sprintf(outbuf, "%d", max.ws_col);
    #else
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    int tmpret;
    tmpret = GetConsoleScreenBufferInfo(hConsole, &csbi);
    (void)tmpret;
    sprintf(outbuf, "%d", csbi.dwSize.X);
    #endif
    goto fexit;
}
if (chkCmd(1, farg[0], "HEIGHT")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    #ifdef __unix__
    struct winsize max;
    ioctl(0, TIOCGWINSZ , &max);
    sprintf(outbuf, "%d", max.ws_row);
    #else
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    int tmpret;
    tmpret = GetConsoleScreenBufferInfo(hConsole, &csbi);
    (void)tmpret;
    sprintf(outbuf, "%d", csbi.dwSize.Y);
    #endif
    goto fexit;
}
if (chkCmd(1, farg[0], "HEX$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%llx", (long long unsigned int)dbl);
    upCase(outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "OCT$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 2) {cerr = 2; goto fexit;}
    double dbl;
    sscanf(farg[1], "%lf", &dbl);
    sprintf(outbuf, "%llo", (long long unsigned int)dbl);
    upCase(outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "FGC")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    sprintf(outbuf, "%d", (int)fgc);
    goto fexit;
}
if (chkCmd(1, farg[0], "BGC")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    sprintf(outbuf, "%d", (int)bgc);
    goto fexit;
}
if (chkCmd(1, farg[0], "INPUT$")) {
    cerr = 0;
    ftype = 1;
    if (fargct > 1) {cerr = 3; goto fexit;}
    if (fargct == 1 && fargt[1] != 1) {cerr = 2; goto fexit;}
    if (fargct != 1) {
        farg[1] = malloc(4);
        strcpy(farg[1], "?: ");
    }
    char* tmp = NULL;
    #ifndef _WIN32
    getCurPos();
    curx--;
    farg[1] = realloc(farg[1], sizeof(farg[1] + curx));
    int ptr = strlen(farg[1]);
    while (curx) {farg[1][ptr] = 22; ptr++; curx--;}
    farg[1][ptr] = 0;
    #endif
    tmp = readline(farg[1]);
    if (tmp != NULL) {
        copyStr(tmp, outbuf);
        free(tmp);
    } else {
        putchar('\n');
    }
    if (fargct != 1) free(farg[1]);
    if (debug) printf("INPUT$ output: {%s}\n", outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "LINES")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    int cl = 1;
    if (!farg[1][0]) {strcpy(outbuf, "0"); goto fexit;}
    for (i = 0; farg[1][i]; i++) {
        if (farg[1][i] == '\n') {
            cl++;
        }
    }
    sprintf(outbuf, "%d", cl);
    goto fexit;
}
if (chkCmd(1, farg[0], "LINE$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 2) {cerr = 3; goto fexit;}
    if (fargt[1] != 2 || fargt[2] != 1) {cerr = 2; goto fexit;}
    int cl = 0, tl = atoi(farg[1]);
    if (tl < 0) {cerr = 16; goto fexit;}
    int i;
    for (i = 0; farg[2][i]; i++) {
        if (farg[2][i] == '\n') {
            cl++;
        } else if (cl == tl) {
            strApndChar(outbuf, farg[2][i]);
        }
    }
    if (outbuf[strlen(outbuf) - 1] == '\r') outbuf[strlen(outbuf) - 1] = 0;
    goto fexit;
}
if (chkCmd(1, farg[0], "CWD$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(getcwd(NULL, 0), outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "FILES$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    DIR* cwd = opendir(".");
    if (!cwd) {cerr = 20; goto fexit;}
    DIR* tmpdir;
    struct dirent* dir;
    #ifdef _WIN32
        #define FSC '\\'
        strcpy(outbuf, ".\\\n..\\");
    #else
        #define FSC '/'
        strcpy(outbuf, "./\n../");
    #endif
    while ((dir = readdir(cwd))) {
        if ((tmpdir = opendir(dir->d_name)) && strcmp(dir->d_name, ".") && strcmp(dir->d_name, "..")) {
            strApndChar(outbuf, '\n');
            copyStrApnd(dir->d_name, outbuf);
            strApndChar(outbuf, FSC);
        }
        if (tmpdir) closedir(tmpdir);
    }
    closedir(cwd);
    cwd = opendir(".");
    while ((dir = readdir(cwd))) {
        if (!(tmpdir = opendir(dir->d_name))) {
            strApndChar(outbuf, '\n');
            copyStrApnd(dir->d_name, outbuf);
        }
        if (tmpdir) closedir(tmpdir);
    }
    closedir(cwd);
    goto fexit;
}
if (chkCmd(2, farg[0], "CHDIR", "CD")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    errno = 0;
    int ret = chdir(farg[1]);
    (void)ret;
    sprintf(outbuf, "%d", errno);
    goto fexit;
}
if (chkCmd(1, farg[0], "_HOME$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(gethome(), outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "_ENV$")) {
    cerr = 0;
    ftype = 1;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    char* tmpenv = getenv(farg[1]);
    if (tmpenv) {
        copyStr(tmpenv, outbuf);
    }
    goto fexit;
}
if (chkCmd(1, farg[0], "_ENVSET")) {
    cerr = 0;
    ftype = 2;
    if (fargct != 1) {cerr = 3; goto fexit;}
    if (fargt[1] != 1) {cerr = 2; goto fexit;}
    char* tmpenv = getenv(farg[1]);
    if (tmpenv) {
        outbuf[0] = '1';
    } else {
        outbuf[0] = '0';
    }
    outbuf[1] = 0;
    goto fexit;
}
if (chkCmd(1, farg[0], "_PROMPT$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    int tmpt = getVal(prompt, outbuf);
    if (tmpt != 1) strcpy(outbuf, "CLIBASIC> ");
    goto fexit;
}
if (chkCmd(1, farg[0], "_DEBUG")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    sprintf(outbuf, "%d", (int)debug);
    goto fexit;
}
if (chkCmd(1, farg[0], "_TXTLOCK")) {
    cerr = 0;
    ftype = 2;
    if (fargct) {cerr = 3; goto fexit;}
    sprintf(outbuf, "%d", (int)textlock);
    goto fexit;
}
if (chkCmd(1, farg[0], "_VER$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(VER, outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "_BITS$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(BVER, outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "_OS$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(OSVER, outbuf);
    goto fexit;
}
if (chkCmd(1, farg[0], "_STARTCMD$")) {
    cerr = 0;
    ftype = 1;
    if (fargct) {cerr = 3; goto fexit;}
    copyStr(startcmd, outbuf);
    goto fexit;
}
