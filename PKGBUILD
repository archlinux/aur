# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=gashell
_pkgname=GAShell
pkgver=0.92
pkgrel=1
pkgdesc="A bash script that generates and securely manages/stores Google Authenticator codes."
arch=('x86_64' 'i686')
url="https://github.com/TechtonicSoftware/GAShell"
license=('GNU V3')
depends=('sed' 'oath-toolkit' 'openssl' 'zbar' 'curl')
provides=('gashell')
source=(https://github.com/TechtonicSoftware/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('95420fe025ad5c8961f23257beb19fba1735307f220fa4b0b390659f1eb823c9')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname/";
    mkdir -p "$pkgdir/usr/bin/";

    cp -R "$srcdir/$_pkgname-$pkgver/$pkgname.sh" "$pkgdir/usr/share/$pkgname/";
    ln -s "/usr/share/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname";
}
