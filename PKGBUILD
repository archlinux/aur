# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=43
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('18518a0f73563a33a87fd20572365945d1fb697c36af85515c2d5ca811d8912936fb20184274bed5fbe57f1a720018323bd11a2d28d56e9968e4bafcccfd513e')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
