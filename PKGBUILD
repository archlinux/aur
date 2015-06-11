# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sshcd
pkgver=1.0.3
pkgrel=1
pkgdesc="ssh command with directory specification support"
arch=(any)
url="https://github.com/fraction/sshcd"
license=(MIT)
depends=(openssh bash)
makedepends=()
source=(https://github.com/fraction/sshcd/archive/v${pkgver}.tar.gz)
sha256sums=(7c5b3dd5ece57a849467167279385cbb8e433617afefe8dee409e3d60d199ca8)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

