# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.7.1
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'netcat')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('993e2217ee232ff756e9e8cfe3bf94f386ab06a399fb675f1c90fc06c349e30587ca796ffcf10d2d5cec284a94d4fbf738146f396ffdcbb7284352e8fbb970ae')

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
