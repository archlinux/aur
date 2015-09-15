import argparse
import os
import sys
import subprocess

THIS_DIR = os.path.abspath(os.path.dirname(__file__))

def check_not_in_venv():
    if os.environ.get("VIRTUAL_ENV"):
        sys.exit("You should not run this in a virtualenv!")

def clean():
    cmd = ["git", "clean", "--force", "-d", "-x"]
    subprocess.check_call(cmd, cwd=THIS_DIR)


def set_version(version):
    pkgbuild = os.path.join(THIS_DIR, "PKGBUILD")
    with open(pkgbuild, "r") as fp:
        lines = fp.readlines()
    new_lines = list()
    for line in lines:
        if line.startswith("pkgver"):
            new_line = "pkgver='%s'\n" % version
            new_lines.append(new_line)
        else:
            new_lines.append(line)

    with open(pkgbuild, "w") as fp:
        fp.writelines(new_lines)


def get_checksum_line():
    cmd = ["makepkg", "--geninteg"]
    output = subprocess.check_output(cmd, cwd=THIS_DIR)
    return output.decode("utf-8")

def set_checksum(checksum_line):
    pkgbuild = os.path.join(THIS_DIR, "PKGBUILD")
    with open(pkgbuild, "r") as fp:
        lines = fp.readlines()
    new_lines = list()
    for line in lines:
        if line.startswith("md5sums"):
            new_lines.append(checksum_line)
        else:
            new_lines.append(line)

    with open(pkgbuild, "w") as fp:
        fp.writelines(new_lines)

def run_makepkg():
    cmd = ["makepkg"]
    subprocess.check_call(cmd, cwd=THIS_DIR)

def run_namcap():
    cmd = ["namcap", "PKGBUILD"]
    subprocess.check_call(cmd, cwd=THIS_DIR)
    contents = os.listdir(THIS_DIR)
    pkgs = [x for x in contents if "pkg.tar.xz" in x]
    if len(pkgs) != 1:
        sys.exit("Expecting one pkg, got %s" % pkgs)
    pkg = pkgs[0]
    cmd = ["namcap", pkg]
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
    set_version(version)
    new_checksum_line = get_checksum_line()
    set_checksum(new_checksum_line)
    run_makepkg()
    print("running namcap ...")
    run_namcap()
    print("namcap OK")
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
