set -e

export ROOTDIR=`pwd`/src/zen-kernel
export GITROOT=`pwd`/zen-kernel
source <( grep -P ^branch= PKGBUILD)
export branch

mv src src_old
makepkg -o --holdver
cp --reflink=always -ar $ROOTDIR src_old

(
cd $GITROOT
git switch $branch || true
git pull origin $branch
) &

cd $ROOTDIR
git branch -D kpatch || true
git branch kpatch
cd -

wait
makepkg -o

cd $ROOTDIR
git diff kpatch > /dev/shm/kpatch.patch
cd -

makepkg -cf # check it compiles

#./scripts/extract-vmlinux /boot/vmlinuz-linux-zen-lts510 > vmlinux
kpatch-build --skip-gcc-check -s $(pwd) -v $(pwd)/vmlinux /dev/shm/kpatch.patch 2> >( grep 'unsupported patch to assembly' | cut -f7 -d' ' | tee remove-patch) ||
(
  filterdiff $(for i in $(cat remove-patch); do echo -n -X $i; done) /dev/shm/kpatch-filtered.patch
  kpatch-build --skip-gcc-check -s $(pwd) -v $(pwd)/vmlinux /dev/shm/kpatch-filtered.patch
)

echo pause for sudo; read
sudo insmod kpatch-kpatch.ko
cd -

sudo pacman -U *pkg.tar*
