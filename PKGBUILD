# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=gashell
_pkgname=GAShell
pkgver=0.9
pkgrel=2
pkgdesc="A bash script that generates and securely manages/stores Google Authenticator codes."
arch=('x86_64' 'i686')
url="https://github.com/TechtonicSoftware/GAShell"
license=('GNU V3')
depends=('sed' 'oath-toolkit' 'openssl' 'zbar' 'curl')
provides=('gashell')
source=(https://github.com/TechtonicSoftware/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('668f68968f0887156b1ab1fede366f62a3275f2e47ba4e8ea3ffc291aa5ea51f')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname/";
    mkdir -p "$pkgdir/usr/bin/";

    cp -R "$srcdir/$_pkgname-$pkgver/$pkgname.sh" "$pkgdir/usr/share/$pkgname/";
    ln -s "/usr/share/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname";
}
