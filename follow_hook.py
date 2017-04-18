#!/usr/bin/env python
"""Follow which hook is handled by the SELinux ALPM hook"""
import logging
import re
import os.path
import subprocess
import sys


ALPM_HOOK_DIR = '/usr/share/libalpm/hooks/'
FOLLOW_DB = os.path.join(os.path.dirname(__file__), 'hook_tracking_db.txt')

logger = logging.getLogger(__name__)


def run_pacman(args):
    """Run a pacman command and return its output"""
    proc = subprocess.Popen(
        ['pacman'] + args,
        env={'LANG': 'C'},
        stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output = proc.stdout.read()
    retval = proc.wait()
    if retval:
        errmsg = proc.communicate()[1].decode('ascii', errors='ignore').strip()
        logger.error("pacman error %d: %s", retval, errmsg)
        return
    return output.decode('ascii', errors='ignore')


def find_package_hooks():
    """Find all available package hooks in Arch Linux repositories

    This uses the file database, which needs to be updated with "pacman -Fy"

    Yield (repo/package name, hook name) tuples
    """
    alpm_hookdir_no_leading_slash = ALPM_HOOK_DIR.lstrip('/')
    pkglist = run_pacman(['-Fqo', ALPM_HOOK_DIR]) or ''
    for pkgname in pkglist.splitlines():
        filelist = run_pacman(['-Fql', pkgname]) or ''
        for filename in filelist.splitlines():
            if filename.startswith(alpm_hookdir_no_leading_slash):
                hookname = filename[len(alpm_hookdir_no_leading_slash):]
                if hookname and hookname.endswith('.hook'):
                    yield (pkgname, hookname)


def get_repo_version(pkgname):
    """Get the version of the package in the repositories"""
    # This function can be called with a "repo/pkgname" argument
    pkgname = pkgname.split('/')[-1]
    pkginfo = run_pacman(['-Si', pkgname]) or ''
    for line in pkginfo.splitlines():
        line = line.rstrip()
        matches = re.match(r'^Version\s*:\s*(\S+)$', line, re.I)
        if matches is not None:
            return matches.group(1)
    logger.error("Unable to find the version of package %s", pkgname)


def read_pkghook_db():
    """Read the package hook tracking database file"""
    pkghookdb = {}
    with open(FOLLOW_DB, 'r') as fdb:
        for line in fdb:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            try:
                pkg, ver, hook = line.split()
            except ValueError:
                # Ignore invalid lines
                logger.warning("Invalid line in tracking database: %r", line)
                continue
            else:
                pkghookdb[(pkg, hook)] = ver
    return pkghookdb


def main():
    current_pkghook_db = read_pkghook_db()
    everything_ok = True
    for pkg, hook in find_package_hooks():
        # Get the versions in the package repositories
        last_ver = get_repo_version(pkg)
        if last_ver is None:
            everything_ok = False
            continue
        # ... and in the tracking database
        cur_ver = current_pkghook_db.get((pkg, hook))

        if last_ver == cur_ver:
            logger.info("OK %s %s %s", pkg, cur_ver, hook)
            continue
        everything_ok = False
        if cur_ver is None:
            logger.info("New hook:")
        else:
            logger.info("Upgrade needed for %s: %s -> %s",
                        pkg, cur_ver, last_ver)
        logger.info("    DB line: %s %s %s", pkg, last_ver, hook)
        hookfile = os.path.join(ALPM_HOOK_DIR, hook)
        logger.info("    File: %s", hookfile)
        # Try to find the Exec line in the file
        if os.path.exists(hookfile):
            exec_lines = []
            target_lines = []
            need_target = False
            with open(hookfile, 'r') as fhook:
                for line in fhook:
                    line = line.rstrip()
                    if line.startswith('Exec'):
                        exec_lines.append(line)
                    elif line.startswith('Target'):
                        target_lines.append(line)
                    elif line.startswith('NeedsTargets'):
                        need_target = True
            # Show Target lines if NeedsTargets was found
            if need_target:
                for line in target_lines:
                    logger.info("    # %s", line)
            for line in exec_lines:
                logger.info("    # %s", line)
    if everything_ok:
        logger.info("Remember to run sudo pacman -Fy to update pacman db")
    return 0


if __name__ == '__main__':
    logging.basicConfig(
        format='[%(levelname)s] %(message)s',
        level=logging.DEBUG)
    sys.exit(main())
