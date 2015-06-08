#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim: foldlevel=0

from math       import log
from os         import environ, listdir, mkdir, stat, unlink
from os.path    import basename, dirname, exists, isdir, isfile, islink, realpath
from subprocess import call, getoutput
from sys        import argv
from time       import localtime, strftime

import gettext

gettext.install("trash")

trashDir = environ["HOME"] + "/.Trash"
dataDir  = trashDir + "/files"
pathDir  = trashDir + "/path"

##### Actions #####
def putToTrash(files):
    _id = _getNextId_()
    for item in files:
        pathItem = ""

        # Get full item path, without following links (ie trash put [link] delete the link, not the link target)
        if not islink(item):
            pathItem = realpath(item)
        else:
            if dirname(item) == "":
                item = "./" + item
            pathItem = realpath(dirname(item)) + "/" + basename(item)

        # FIXME: Find a better way to do this
        call(['mv', pathItem, dataDir+"/{itemId}".format(itemId=_id)])

        # Write metadata
        with open(pathDir+"/{itemId}".format(itemId=_id), "w") as f:
            f.write("{path}".format(path=pathItem))

        print(_("Trashed [{itemId}] {path}").format(path=item, itemId=_id))
        _id += 1

def listTrash():
    items = [int(i) for i in listdir(pathDir)]
    items.sort()
    itemLen = len("%d" % max(items+[1]))
    print(_("Total size : %s\n") % _trashSize_()[1])

    for item in items:
        with open(pathDir+"/{itemId}".format(itemId=item), "r") as f:
            path = f.read().replace("\n", "")

        dataItem = dataDir+"/{itemId}".format(itemId=item)
        if exists(dataItem) and not islink(dataItem):
            print("\x1B[1;33m%*d: \x1B[0;32m[%s]\x1B[0m %s" % (itemLen, item, strftime("%F %T", localtime(stat(dataDir+"/{itemId}".format(itemId=item)).st_mtime)), path))
        elif islink(dataItem):
            print("\x1B[1;33m%*d: \x1B[0;37m[link]\x1B[0m                %s" % (itemLen, item, path))
        else:
            print("\x1B[1;33m%*d: \x1B[1;31m[invalid]\x1B[0m             %s" % (itemLen, item, path))

def dropItems(ids):
    for item in ids:
        path=""

        dataItem = dataDir+"/{itemId}".format(itemId=item)
        if not exists(dataItem) and not islink(dataItem):
            print(_("ERR: Item #{itemId} was not found in the trash.").format(itemId=item))

        if isfile(pathDir+"/{itemId}".format(itemId=item)):
            with open(pathDir+"/{itemId}".format(itemId=item), "r") as f:
                path = f.read().replace("\n", "")
            unlink(pathDir+"/{itemId}".format(itemId=item))

        call(['rm', '-r', '{d}/{item}'.format(d=dataDir, item=item)])
        print(_("Dropped [{itemId}] {itemPath}").format(itemId=item, itemPath=path))

def restoreItems(ids):
    for item in ids:
        path = ""
        dataItem = dataDir+"/{itemId}".format(itemId=item)
        if not exists(dataItem) and not islink(dataItem):
            print(_("ERR: Item #{itemId} was not found in the trash.").format(itemId=item))
            continue

        if isfile(pathDir+"/{itemId}".format(itemId=item)):
            with open(pathDir+"/{itemId}".format(itemId=item), "r") as f:
                path = f.read().replace("\n", "")
        
        call(['mv', dataDir+"/{itemId}".format(itemId=item), path])
        unlink(pathDir+"/{itemId}".format(itemId=item))
        print(_("Restored [{itemId}] {itemPath}").format(itemId=item, itemPath=path))

def orderIds():
    notFound = 0
    for num, item in enumerate([int(i) for i in listdir(pathDir)]):
        print(_("Ordering items… %s") % "|/—\\"[num%4], end="\r")

        dataItem = dataDir+"/{itemId}".format(itemId=item)
        if exists(dataItem) or islink(dataItem):
            if num+1 != item:
                print(_("\rMoved {old} to {new}\x1B[0K").format(old=item, new=num+1))
                call(['mv', dataDir+"/{itemId}".format(itemId=item), dataDir+"/{itemId}".format(itemId=num+1)])
        else:
            print(_("\r\x1B[1;31mERR:\x1B[0m Item #{itemId} does not exist under {path}, deleting its metadata\x1B[0K").format(itemId=item, path=dataDir))
            unlink(pathDir+"/{itemId}".format(itemId=item))
            notFound += 1
        if num+1 != item:
            call(['mv', pathDir+"/{itemId}".format(itemId=item), pathDir+"/{itemId}".format(itemId=num+1)])
    
    if notFound > 0:
        print(_("\x1B[1;33mWARNING:\x1B[0m {items} item(s) were not found in {place} and cleaned.").format(items=notFound, place=dataDir))

def showHelp():
    print(basename(argv[0])+" [put <path [path [...]]> | list | drop <id [id [...]]> | restore <id [id [...]]> | gc]")
    print(_("\n- put:\t\tPut items to trash\n- list:\t\tList trashed items with their id\n- drop:\t\tDrop items from the trash\n- restore:\tRestore items from the trash to their original path\n- gc:\t\tReorder items"))

##### Useful stuff #####
def _checkTrashDir_():
    if not isdir(trashDir):
        mkdir(trashDir, 0o755)

    if not isdir(dataDir):
        mkdir(dataDir, 0o755)

    if not isdir(pathDir):
        mkdir(pathDir, 0o755)

def _trashSize_():
    b = int(getoutput('du -sb {path}/'.format(path=dataDir)).split()[0])
    if b == 0:
        return (0, "0 B")

    exp = int(log(b, 1024))
    return (b, "%3.2f %s" % (b/(1024**exp), ["B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB"][exp]))

def _getNextId_():
    return 1 + max([int(item) for item in listdir(pathDir)]+[0])

##### MAIN #####
if __name__ == "__main__":
    args = argv[1:]
    _checkTrashDir_()

    while len(args) > 0:
        arg = args[0]
        args = args[1:]
        
        if arg == "put":
            putToTrash(args)
            break
        
        if arg == "list":
            listTrash()
            continue
        
        if arg == "drop":
            dropItems(args)
            break

        if arg == "restore":
            restoreItems(args)
            break

        if arg == "gc":
            orderIds()
            continue

        showHelp()
        break
