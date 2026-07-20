# Maintainer: CamelliaTse
# Contributor: CamelliaTse

pkgname=shacklog
pkgver=1.0.0
pkgrel=1
pkgdesc="ShackLog - 无线电通联记录工具 / Radio QSO Logger (Ham Radio QSO Logger)"
arch=('any')
url="https://github.com/CamelliaTse/shacklog"
license=('MIT')
depends=('python-rich')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/CamelliaTse/shacklog/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 shacklog "$pkgdir/usr/bin/shacklog"
    install -Dm644 README.md "$pkgdir/usr/share/doc/shacklog/README.md"
}
