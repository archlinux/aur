# Maintainer: Fridrich Csoltko <crwxrws@protonmail.com>

pkgname=ofmc-bin
_pkgname=ofmc
pkgver=2018
pkgrel=1
pkgdesc="Open-Source Fixed-Point Model-Checker"
arch=('x86_64')
url="http://www.imm.dtu.dk/~samo/"
license=('BSD')
depends=('gmp' 'libffi')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("http://www.imm.dtu.dk/~samo/$_pkgname-$pkgver.zip")
md5sums=('25dbffa5e0f8da90fa6b28d943b09965')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 "executable for linux/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "BSD License.txt"  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
