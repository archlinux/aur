import argparse
import os
import sys
import subprocess

if sys.version_info.major < 3:
    sys.exit("Python3 required")

THIS_DIR = os.path.abspath(os.path.dirname(__file__))

def check_not_in_venv():
    if os.environ.get("VIRTUAL_ENV"):
        sys.exit("You should not run this in a virtualenv!")

def clean():
    cmd = ["git", "clean", "--force", "-d", "-x"]
    subprocess.check_call(cmd, cwd=THIS_DIR)


def set_version(version):
    version_changed = False
    pkgbuild = os.path.join(THIS_DIR, "PKGBUILD")
    with open(pkgbuild, "r") as fp:
        lines = fp.readlines()
    new_lines = list()
    for line in lines:
        if line.startswith("pkgver"):
            previous_version = line.split("=")[1]
            if previous_version != version:
                version_changed = True
            new_line = "pkgver='%s'\n" % version
            new_lines.append(new_line)
        else:
            new_lines.append(line)

    with open(pkgbuild, "w") as fp:
        fp.writelines(new_lines)
    return version_changed

def reset_pkgrel():
    pkgbuild = os.path.join(THIS_DIR, "PKGBUILD")
    with open(pkgbuild, "r") as fp:
        lines = fp.readlines()
    new_lines = list()
    for line in lines:
        if line.startswith("pkgrel"):
            new_line = "pkgrel='1'\n"
            new_lines.append(new_line)
        else:
            new_lines.append(line)
    with open(pkgbuild, "w") as fp:
        fp.writelines(new_lines)

def set_checksums():
    cmd = ["/usr/bin/updpkgsums"]
    subprocess.check_call(cmd, cwd=THIS_DIR)

def run_makepkg():
    cmd = ["/usr/bin/extra-x86_64-build"]
    subprocess.check_call(cmd, cwd=THIS_DIR)


def update_srcinfo():
    cmd = ["mksrcinfo"]
    subprocess.check_call(cmd, cwd=THIS_DIR)

def commit_all(version):
    cmd = ["git", "add", "PKGBUILD", ".SRCINFO"]
    subprocess.check_call(cmd)
    cmd = ["git", "commit", "--message", "Update to %s" % version]
    subprocess.check_call(cmd)

def push():
    cmd = ["git", "--no-pager", "show", "HEAD"]
    subprocess.check_call(cmd)
    answer = input("OK to push (y/n)? ")
    if answer == "y":
        cmd = ["git", "push"]
        subprocess.check_call(cmd)

def make_release(version):
    clean()
    version_changed = set_version(version)
    if version_changed:
        reset_pkgrel()
    set_checksums()
    run_makepkg()
    update_srcinfo()
    commit_all(version)
    push()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("version")
    args = parser.parse_args()
    check_not_in_venv()
    version = args.version
    make_release(version)

if __name__ == "__main__":
    main()
