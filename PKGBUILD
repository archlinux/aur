# Maintainer: IgnusG <6438760+IgnusG@users.noreply.github.com>

pkgname='trunk-check'
pkgver='1.22.2'
pkgrel=1
url='https://trunk.io/'
arch=('x86_64')
license=('unknown')
install=trunk.install
pkgdesc='Trunk is a blazingly fast meta code checker and formatter'
source=("https://trunk.io/releases/trunk-${pkgver//_/-}.linux.tar.gz")
sha512sums=('9c9928e6b51e8cddf3c159c94b11481ac0aa912fc5ebdf93365c747cb29357146c212279199a950cc82792e8f9739d70365f9626719be9cb23cb4fedda07310c')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m 755 "$srcdir/trunk" "$pkgdir/usr/bin/trunk"
}

