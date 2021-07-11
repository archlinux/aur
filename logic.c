if (chkCmd(1, ltmp[0], "REM")) return true;
if (chkCmd(2, ltmp[0], "?;", "PRINT;")) {
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) return true;
    }
    if (itstackp > -1) {
        if (itdcmd[itstackp]) return true;
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    for (int i = j; cmd[i]; i++) {
        if (cmd[i] != ' ') {cerr = 1; return true;}
    }
    fputs("", stdout);
    fflush(stdout);
    return true;
}
if (chkCmd(2, ltmp[0], "?", "PRINT")) {
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) return true;
    }
    if (itstackp > -1) {
        if (itdcmd[itstackp]) return true;
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    while (cmd[j] == ' ') j++;
    if (cmd[j] == 0) {putchar('\n'); return true;}
    else {j--;}
    bool inStr = false;
    int pct = 0;
    int ptr = 0;
    int i = j;
    while (cmd[i]) {
        i++;
        if (cmd[i] == '"') {inStr = !inStr;}
        if (cmd[i] == '(' && !inStr) {pct++;}
        if (cmd[i] == ')' && !inStr) {pct--;}
        if (cmd[i] == ' ' && !inStr) {} else
        if ((cmd[i] == ',' || cmd[i] == ';' || cmd[i] == 0) && !inStr && pct == 0) {
            ltmp[1][ptr] = 0; ptr = 0;
            int len = strlen(ltmp[1]);
            int tmpt;
            if (debug) printf(">ltmp[1]: {%s}\n", ltmp[1]);
            if (!(tmpt = getVal(ltmp[1], ltmp[1]))) return true;
            if (debug) printf(">ltmp[1]: {%s}\n", ltmp[1]);
            if (cmd[j] == ',') {
                if (tmpt != 255) {putchar('\t');}
                else {putchar('\n');}
            }
            fputs(ltmp[1], stdout);
            if (cmd[i] == 0 && len > 0) putchar('\n');
            j = i;
        } else
        {ltmp[1][ptr] = cmd[i]; ptr++; if (debug) printf("ltmp[1]: {%s}\n", ltmp[1]);}
    }
    if (pct || inStr) {cerr = 1; return true;}
    fflush(stdout);
    return true;
}
if (chkCmd(1, ltmp[0], "DO")) {
    if (dlstackp >= 255) {cerr = 12; return true;}
    dlstackp++;
    if (itstackp > -1) {
        if (itdcmd[itstackp]) {dldcmd[dlstackp] = true; return true;}
    }
    if (dlstackp > 0) {
        if (dldcmd[dlstackp - 1]) {dldcmd[dlstackp] = true; return true;}
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    int p = j;
    while (cmd[p]) {if (cmd[p] != ' ') {cerr = 1; return true;} p++;}
    dldcmd[dlstackp] = false;
    dlstack[dlstackp] = cmdpos;
    dlpline[dlstackp] = progLine;
    return true;
}
if (chkCmd(1, ltmp[0], "DOWHILE")) {
    if (dlstackp >= 255) {cerr = 12; return true;}
    dlstackp++;
    if (itstackp > -1) {
        if (itdcmd[itstackp]) {dldcmd[dlstackp] = true; return true;}
    }
    if (dlstackp > 0) {
        if (dldcmd[dlstackp - 1]) {dldcmd[dlstackp] = true; return true;}
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    copyStrSnip(cmd, j + 1, strlen(cmd), ltmp[1]);
    uint8_t testval = logictest(ltmp[1]);
    if (testval != 1 && testval) return true;
    if (testval == 1) dlpline[dlstackp] = progLine;
    if (testval == 1) dlstack[dlstackp] = cmdpos;
    dldcmd[dlstackp] = (bool)testval;
    dldcmd[dlstackp] = !dldcmd[dlstackp];
    return true;
}
if (chkCmd(1, ltmp[0], "LOOP")) {
    if (dlstackp <= -1) {cerr = 6; return true;}
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) {dlstackp--; return true;}
    }
    if (itstackp > -1) {
        if (itdcmd[itstackp]) return true;
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    cp = dlstack[dlstackp];
    progLine = dlpline[dlstackp];
    lockpl = true;
    dldcmd[dlstackp] = false;
    dlstackp--;
    int p = j;
    while (cmd[p]) {if (cmd[p] != ' ') {cerr = 1; return true;} p++;}
    didloop = true;
    return true;
}
if (chkCmd(1, ltmp[0], "LOOPWHILE")) {
    if (dlstackp <= -1) {cerr = 6; return true;}
    if (itstackp > -1) {
        if (itdcmd[itstackp]) return true;
    }
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) {dlstackp--; return true;}
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    copyStrSnip(cmd, j + 1, strlen(cmd), ltmp[1]);
    uint8_t testval = logictest(ltmp[1]);
    if (testval != 1 && testval) return true;
    if (testval == 1) {cp = dlstack[dlstackp]; progLine = dlpline[dlstackp]; lockpl = true;}
    dldcmd[dlstackp] = false;
    dlstackp--;
    didloop = true;
    return true;
}
if (chkCmd(1, ltmp[0], "IF")) {
    if (itstackp >= 255) {cerr = 13; return true;}
    itstackp++;
    if (itstackp > 0) {
        if (itdcmd[itstackp - 1]) {itdcmd[itstackp] = true; return true;}
    }
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) {itdcmd[itstackp] = true; return true;}
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    copyStrSnip(cmd, j + 1, strlen(cmd), ltmp[1]);
    uint8_t testval = logictest(ltmp[1]);
    if (testval != 1 && testval) return true;
    itdcmd[itstackp] = (bool)!testval;
    return true;
}
if (chkCmd(1, ltmp[0], "ELSE")) {
    if (itstackp <= -1) {cerr = 8; return true;}
    if (itstackp > 0) {
        if (itdcmd[itstackp - 1]) return true;
    }
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) return true;
    }
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    if (didelse) {cerr = 11; return true;}
    didelse = true;
    itdcmd[itstackp] = !itdcmd[itstackp];
    return true;
}
if (chkCmd(1, ltmp[0], "ENDIF")) {
    if (itstackp <= -1) {cerr = 7; return true;}
    if (fnstackp > -1) {
        if (fndcmd[fnstackp]) return true;
    }
    itdcmd[itstackp] = false;
    didelse = false;
    itstackp--;
    return true;
}
if (chkCmd(1, ltmp[0], "FOR")) {
    if (itstackp >= 255) {cerr = 13; return true;}
    fnstackp++;
    if (itstackp > -1) {
        if (itdcmd[itstackp]) {return true;}
    }
    if (dlstackp > -1) {
        if (dldcmd[dlstackp]) {return true;}
    }
    if (fnstackp > 0) {
        if (fndcmd[fnstackp - 1]) {return true;}
    }
    copyStrSnip(cmd, j + 1, strlen(cmd), ltmp[1]);
    if (getArgCt(ltmp[1]) != 4) {cerr = 3; return true;}
    cerr = 2;
    getArg(0, ltmp[1], fnvar);
    if (getVar(fnvar, forbuf[0]) != 2) return true;
    getArg(1, ltmp[1], forbuf[1]);
    if (getVal(forbuf[1], forbuf[1]) != 2) return true;
    getArg(3, ltmp[1], forbuf[3]);
    if (getVal(forbuf[3], forbuf[3]) != 2) return true;
    if (fnstack[fnstackp] == -1) {
        setVar(fnvar, forbuf[1], 2);
        copyStr(forbuf[1], forbuf[0]);
    }
    getArg(2, ltmp[1], forbuf[2]);
    sprintf(forbuf[0], "%lf", atof(forbuf[0]) + atof(forbuf[3]));
    setVar(fnvar, forbuf[0], 2);
    int testval = logictest(forbuf[2]);
    if (testval == -1) return true;
    fndcmd[fnstackp] = !(bool)testval;
    if (!(fninfor[fnstackp] = (bool)testval)) {cerr = 0; return true;}
    if (fnstack[fnstackp] == -1) {
        sprintf(forbuf[0], "%lf", atof(forbuf[0]) - atof(forbuf[3]));
        setVar(fnvar, forbuf[0], 2);
    }
    fnstack[fnstackp] = cmdpos;
    fnpline[fnstackp] = progLine;
    cerr = 0;
    return true;
}
if (chkCmd(1, ltmp[0], "NEXT")) {
    if (fnstackp <= -1) {cerr = 9; return true;}
    if (fninfor[fnstackp]) {
        cp = fnstack[fnstackp];
        progLine = fnpline[fnstackp];
        lockpl = true;
        didloop = true;
        fnstackp--;
    } else {
        fnstack[fnstackp] = -1;
        fnstackp--;
    }
    return true;
}
