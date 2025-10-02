# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=43
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.3
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('daeb247888ddba335c18be7284ba5953c6a88311b08818e52011d3cdeff98fc18f87a6289d24ab87864c86f9d06848f9a0e3e0d63f3ab74868672f94a0e6a6fc')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
