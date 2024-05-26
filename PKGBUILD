# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f34-backgrounds
pkgver=34.0.1
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 34 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
replaces=("f34-backgrounds-fedoradesign")
source=("https://github.com/fedoradesign/backgrounds/releases/download/v34.0.1/f34-backgrounds-34.0.1.tar.xz")
b2sums=('22295e9eb8e9d9d3ae73b6ebcc2766d5f9a0975614ffa3c01d7328cd25dc5927b01c3d58e182c07fa0627ca899437072467bdcda7b8e06edbee413c40261e009')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
