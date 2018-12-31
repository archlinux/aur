# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.6.2
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'netcat')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('b5c0c386b579e8cb3d24545a0424fecc55850eefe871129ffa7c10f674379ad35db4a20b0c3884084c53b30ea1c9b8b52e2577233582845581247fa7a243a442')

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
