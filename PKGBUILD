# Submitter: Jochum Döring <jooch at gmx dot com>
# Maintainer: Jochum Döring <jooch at gmx dot com>

pkgname=systester-cli-bin
_pkgname=systester
pkgver=1.5.1
pkgrel=1
pkgdesc="System Stability Tester is a RAM/CPU burning and benchmarking program based on calculating pi."
depends=('gmp>=4.2.1')
conflicts=('systester-cli')
license=('GPL')
arch=('x86_64')
url="http://systester.sourceforge.net/"
source=(http://sourceforge.net/projects/${_pkgname}/files/${_pkgname}/1.5.0/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha256sums=('48bedf763862102bd525b452585054f1d0bde0c2130c7a1be3f9c83aeb9535ae')

package() {
install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-amd64/systester-cli" "$pkgdir/usr/bin/systester-cli"
install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-amd64/systester-lite" "$pkgdir/usr/bin/systester-lite"
}
