# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='1.22.15'
pkgrel=1
url='https://trunk.io/'
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/trunk-${pkgver//_/-}.linux.tar.gz")
sha512sums=('d1e0469a2bc2a8f4bffa1f1408d7bb4ff8c5f6e3cf3d44e75e17f9b717ce9a613329969099a65d9ab99886cc99720c1a12517619a09a57d6aec42d8704239685')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk" "$pkgdir/usr/bin/trunk"
}
