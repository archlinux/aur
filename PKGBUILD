# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-gtk-theme
pkgver=0.0.1
pkgrel=2
pkgdesc="GTK Theme para LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lgt"
license=('GPL')
depends=('lynx-icons-theme')
source=("$url/-/archive/$pkgver/lgt-$pkgver.tar.gz")
md5sums=('a88d309f13fc99187e624599a328076b')


package() {
    cd $_pkgbase
    mkdir $srcdir/themes/
    mkdir $srcdir/themes/LynxOS
    cp -r $srcdir/lgt-$pkgver/* $srcdir/themes/LynxOS
    install -dm755 /usr/share/themes/
    sudo cp -r $srcdir/themes /usr/share/
    rm -r $srcdir/themes
}
