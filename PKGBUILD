# Maintainer: Fgaoxing <fgaoxing0206@outlook.com>;
pkgname=compbench
pkgver=1.0.0
pkgrel=4
pkgdesc="A CLI tool for testing the compression performance of a file under different algorithms"
arch=("x86_64")
url="https://github.com/Fgaoxing/Compbench"
license=("GPL-3.0-or-later")
source=("https://github.com/Fgaoxing/Compbench/releases/download/v1.0.0/compbench-linux-x86_64.tar.gz")
sha256sums=("247607aca52b5a1e4630b719ee3682d51c0986265299777e07d82efed391dce9")


package() {
    cd $srcdir;
    tar -zxvf compbench-linux-x86_64.tar.gz
    mkdir -p $pkgdir/usr/bin
    cp ./compbench $pkgdir/usr/bin
}
