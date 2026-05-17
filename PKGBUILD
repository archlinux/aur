# Maintainer: database64128 <free122448@hotmail.com>

_fedoraver=44
pkgname=f$_fedoraver-backgrounds
pkgver=$_fedoraver.0.0
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora $_fedoraver default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://forge.fedoraproject.org/design/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://forge.fedoraproject.org/design/backgrounds/releases/download/v44.0.0/f44-backgrounds-44.0.0.tar.xz")
b2sums=('7c8e6b3e1a5a5150fe2af016ac31173376841c74b3a2a421ebe068fe212d8f5f45e46c371e244128d176611222cd7feff2a57b83509868cf582b97544983bfec')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make install DESTDIR="$pkgdir"
}
