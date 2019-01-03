# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.7.0
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'netcat')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('d5e954701569376162994ce7c4cbd6f35922befea4e59798873e3886b223d2020884466f1cee80585207c7a1b5822861d35caf35cf5fb651e99c50e041e57d97')

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
