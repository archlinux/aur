# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=topgit
pkgver=0.19.10
pkgrel=1
pkgdesc="A different patch queue manager"
url="https://github.com/mackyle/topgit"
arch=('any')
license=('GPL2')
depends=('gawk' 'bash')
makedepends=()
source=(
  "https://github.com/mackyle/topgit/archive/topgit-${pkgver}.tar.gz"
)
sha256sums=('8a334ac1b3dfa2bf0b0612cf565e6077b42b7b4029db1b5f54322c84ef8deb9c')

package() {
  cd "$pkgname-topgit-$pkgver"
  make prefix=/usr cmddir=/usr/lib/topgit DESTDIR="$pkgdir" install
}
