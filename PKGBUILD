# $Id$
# Maintainer: Doctorzeus <simmlog@gmail.com>

pkgname=gashell
_pkgname=GAShell
pkgver=0.921
pkgrel=1
pkgdesc="A bash script that generates and securely manages/stores Google Authenticator codes."
arch=('x86_64' 'i686')
url="https://github.com/TechtonicSoftware/GAShell"
license=('GNU V3')
depends=('sed' 'oath-toolkit' 'openssl' 'zbar' 'curl')
provides=('gashell')
source=(https://github.com/TechtonicSoftware/$_pkgname/archive/$pkgver.tar.gz)
sha256sums=('5e7b77e2576b82e56e73d8741ac7173e1e78b44fa9b414bb76ff2016ea4c0193')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname/";
    mkdir -p "$pkgdir/usr/bin/";

    cp -R "$srcdir/$_pkgname-$pkgver/$pkgname.sh" "$pkgdir/usr/share/$pkgname/";
    ln -s "/usr/share/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname";
}
