# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=jupyterlab-desktop
pkgver=3.2.1
pkgrel=1
pkgdesc="JupyterLab desktop application, based on Electron."

url="https://github.com/jupyterlab/jupyterlab-desktop"
license=("MIT License")

arch=('x86_64')
source=("https://github.com/jupyterlab/jupyterlab-desktop/releases/download/$pkgver-$pkgrel/JupyterLab-Setup-Debian.deb")

md5sums=('SKIP')

prepare(){
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
    cd $srcdir
    mv usr $pkgdir/
    mv opt $pkgdir/
}
