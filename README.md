how to build 32-bit Linux executable manually

```
linux-x86_64 > src/naiveproxy-76.0.3809.87-2/src $ build_x86.sh
linux-i{3,6}86 > src/naiveproxy-76.0.3809.87-2/src/out/Release $ clang++ -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m32 -Wl,-O2 -Wl,--gc-sections -rdynamic -nostdlib++ -pie -Wl,--disable-new-dtags -o ./naive -Wl,--start-group @./naive.rsp -Wl,--end-group -ldl -lpthread -lrt -lsmime3 -lnss3 -lnssutil3 -lplds4 -lplc4 -lnspr4 -lresolv -latomic
```

how to create arch32 builder docker image
```
sudo pacstrap -c . base base-devel git ninja cmake nspr nss clang
```

makepkg
```
env CARCH=i686 makepkg -fp PKGBUILD.x86
env CARCH=i386 makepkg -fp PKGBUILD.x86
env CARCH=pentium4 makepkg -fp PKGBUILD.x86
env CARCH=arm64 makepkg -sf --needed --noconfirm --skipinteg -p PKGBUILD.arm64
```
