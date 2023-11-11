# Maintainer: Davidyz (hzjlyz@gmail.com)
pkgname=plymouth-theme-550w-git
pkgver=0.1
pkgrel=1
pkgdesc="A Plymouth theme for the 550W from movie The Wandering Earth."
arch=('any')
url=""
license=('GPL')
depends=(plymouth)
source=("git+https://github.com/Davidyz/plymouth-theme-550w.git")
md5sums=("SKIP") #generate with 'makepkg -g'
install=plymouth-theme-550w.install

package() {
    cd "${pkgname//-git/}"
    mkdir -p $pkgdir/usr/share/plymouth/themes/550w/
    install -Dm755 assets/* $pkgdir/usr/share/plymouth/themes/550w
}
