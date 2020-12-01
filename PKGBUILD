# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-icons-theme
pkgver=0.0.1
pkgrel=2
pkgdesc="Icons Theme para LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lit"
license=('GPL')
source=("$url/-/archive/$pkgver/lit-$pkgver.tar.gz")
md5sums=('17b96f35398452fbc029341d3409cf97')


package() {
    cd $_pkgbase
    mkdir $srcdir/icons/
    mkdir $srcdir/icons/LynxOS
    cp -r $srcdir/lit-$pkgver/* $srcdir/icons/LynxOS
    install -dm755 /usr/share/icons/
    sudo cp -r $srcdir/icons /usr/share/
    rm -r $srcdir/icons
}
