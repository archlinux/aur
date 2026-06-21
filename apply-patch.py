#!/usr/bin/env python3
# Script to apply patch file (<build>.patch)
import tarfile
import os
import tempfile
import subprocess
from enum import Enum
from dataclasses import dataclass

def apply_xdelta3(path: str, patch_path: str):
    existed = os.path.exists(path)
    source_path = path if existed else "/dev/null"
    tmp_path = path + ".tmp"
    proc = subprocess.run([ "xdelta3", "-d", "-s", source_path, patch_path, tmp_path ])
    if proc.returncode != 0:
        print(f"xdelta3 exited with status code {proc.returncode}")
        exit(1)
    if existed:
        os.remove(path)
    os.rename(tmp_path, path)

class PatchCompression(Enum):
    NONE = 0
    XDELTA = 1
    BSDIFF = 2

@dataclass(frozen=True)
class PatchEntry:
    name: str
    compression: PatchCompression

class PatchFile:
    def __init__(self, path: str):
        self.path = path

    def __enter__(self) -> self:
        self.tar = tarfile.open(self.path, "r:gz")
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.tar.close()

    def __iter__(self):
        for inf in self._tar().getmembers():
            if not inf.isfile():
                continue
            name = inf.name
            if name.startswith("xdelta/"):
                compression = PatchCompression.XDELTA
                path = name[7:]
            elif name.startswith("bsdiff/"):
                compression = PatchCompression.BSDIFF
                path = name[7:]
            else:
                compression = PatchCompression.NONE
                path = name
            yield PatchEntry(path, compression)

    def _tar(self) -> tarfile.TarFile:
        if self.tar is None:
            raise RuntimeError("patch file is not open")
        return self.tar

    def apply_patch(self, entry: PatchEntry, dest: str):
        name = entry.name
        target = os.path.join(dest, name)
        target_dir = os.path.dirname(target)
        if not os.path.isdir(target_dir):
            os.makedirs(target_dir)

        compression = entry.compression
        match compression:
            case PatchCompression.NONE:
                tar_path = name
                use_xdelta = False
            case PatchCompression.XDELTA:
                tar_path = f"xdelta/{name}"
                use_xdelta = True
            case PatchCompression.BSDIFF:
                raise RuntimeError("bsdiff not implemented")
            case _:
                raise AssertionError()

        tar = self._tar()
        info = tar.getmember(tar_path)
        if use_xdelta:
            with tempfile.TemporaryDirectory() as patch_dir:
                patch_file = os.path.join(patch_dir, info.name)
                tar.extract(info, patch_dir)
                apply_xdelta3(target, patch_file)
        else:
            old_name = target + ".bak"
            using_old = os.path.exists(target)
            if using_old:
                os.rename(target, old_name)
            tar.extract(info, target_dir)
            if not os.path.exists(target):
                if using_old:
                    os.rename(old_name, target)
                raise RuntimeError(f"failed to properly extract {target}")
            if using_old:
                os.remove(old_name)


def find_patch_file(home: str) -> PatchFile:
    ret: str | None = None
    for name in os.listdir(home):
        if not name.endswith(".patch"):
            continue
        if not ret is None:
            print("multiple patch files found!")
            exit(1)
        ret = os.path.join(home, name)
    if ret is None:
        print("no patch files found!")
        exit(1)
    return PatchFile(ret)

if __name__ == '__main__':
    home = os.getcwd()
    with find_patch_file(home) as patches:
        for entry in patches:
            print(f"- {entry.name}")
            patches.apply_patch(entry, home)
