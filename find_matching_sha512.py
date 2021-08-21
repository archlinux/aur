#!/usr/bin/env python
import sys

if __name__ == "__main__":
    arch = ""
    path = ""
    name = ""
    versiontofind = ""
    archfound = False
    versionfound = False

    for i, arg in enumerate(sys.argv):
        if (i == 1):
            name = arg
        if (i == 2):
            versiontofind = arg
        if (i == 3):
            arch = arg
        if (i == 4):
            path = arg

    with open(path, 'r') as file:
        line = file.readline()
        while line:
            if ("Version:" in line):
                versionfound = False

            if (arch in line):
                archfound = True

            if (versiontofind in line):
                versionfound = True

            if(versionfound == True and archfound == True):
                if ("SHA512" in line):
                    # Remove the newline character at the end of the sum
                    line = line.strip('\n')
                    print(line[8:] + " " + name + "_" + versiontofind + "_" + arch + ".deb")
                    break

            line = file.readline()


