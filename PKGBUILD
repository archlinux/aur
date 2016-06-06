# Maintainer: Amirreza Firoozi <firoozi128.af@gmail.com>
pkgname=wttr
pkgver=1.2.2
pkgrel=2
epoch=
pkgdesc="a simple script that helps you check weather condition using site : http://wttr.in "
arch=('i686' 'x86_64')
url="https://Github.com/AmirrezaFiroozi/wttr"
license=('GPL3')
depends=('curl')
install=$pkgname.install
md5sums=('SKIP')
changelog=
source=("https://github.com/AmirrezaFiroozi/wttr/archive/v1.2.1.tar.gz")
noextract=()

package() {
mkdir -p $pkgname/usr/bin/
mkdir -p $pkgname/usr/share/${pkgname}/
cp -r "$srcdir"/${pkgname}-${pkgver}/* $srcdir/
    cd "$srcdir"
    install -Dm0755 "wttr_main" $pkgdir/usr/bin/wttr
    install -Dm0755 "changelog" $pkgdir/usr/share/${pkgname}/changelog
}

