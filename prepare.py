#!/usr/bin/env python3
"""Prepare a fresh patched source tree. Never installs or loads a driver."""
import argparse,gzip,hashlib,pathlib,shutil,subprocess,tempfile
HERE=pathlib.Path(__file__).resolve().parent
SHA256='04c286ba452fe0cfbea2c47465f0c48b0659c09b896f05f363feba680dd8efda'
p=argparse.ArgumentParser();p.add_argument('--deb',type=pathlib.Path,required=True);p.add_argument('--output',type=pathlib.Path,required=True);a=p.parse_args()
a.deb=a.deb.resolve();a.output=a.output.resolve()
if a.output.exists():p.error('output must not exist; existing work is never replaced')
if hashlib.sha256(a.deb.read_bytes()).hexdigest()!=SHA256:p.error('vendor archive checksum does not match the reviewed 3.1.0 package')
with tempfile.TemporaryDirectory(prefix='mtgpu-prepare-') as d:
 d=pathlib.Path(d)
 # Known-hash vendor archive, extract kernel sources only.
 with (d/'data.tar.xz').open('wb') as out:subprocess.run(['bsdtar','-xOf',str(a.deb),'data.tar.xz'],stdout=out,check=True)
 subprocess.run(['bsdtar','-xf',str(d/'data.tar.xz'),'-C',str(d),'./usr/src/mtgpu-3.1.0'],check=True)
 source=d/'usr/src/mtgpu-3.1.0';c=source/'conftest';c.write_bytes(gzip.decompress(c.read_bytes().split(b'\n',48)[48]))
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(HERE/'patches/linux-modern.patch')],cwd=source,check=True,stdout=subprocess.DEVNULL)
 a.output.parent.mkdir(parents=True,exist_ok=True);shutil.copytree(source,a.output,symlinks=True)
print(a.output)
