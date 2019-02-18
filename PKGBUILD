# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.8.0
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'netcat')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('50853299ab7f14edd0825dedd59047a3075d064166925ed150f81feaa99f57d458d88023e8617fbe5577958b8345ef205874f1a88a913e17dc9b96cff6a60e45')

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
