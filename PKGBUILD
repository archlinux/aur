# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=gashell
_pkgname=GAShell
pkgver=0.91
pkgrel=1
pkgdesc="A bash script that generates and securely manages/stores Google Authenticator codes."
arch=('x86_64' 'i686')
url="https://github.com/TechtonicSoftware/GAShell"
license=('GNU V3')
depends=('sed' 'oath-toolkit' 'openssl' 'zbar' 'curl')
provides=('gashell')
source=(https://github.com/TechtonicSoftware/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('f379ed44e88949629ad65f5c1b9ecd248feaec35fc57770005d35176d2609a69')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname/";
    mkdir -p "$pkgdir/usr/bin/";

    cp -R "$srcdir/$_pkgname-$pkgver/$pkgname.sh" "$pkgdir/usr/share/$pkgname/";
    ln -s "/usr/share/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname";
}
