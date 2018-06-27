# Maintainer: Terin Stock <terinjokes@gmail.com>

pkgname=topgit
pkgver=0.19.11
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
sha256sums=('f799c007d937ace94aa3dd905695dfe36bed758149e36a8206334feae3dcc45a')

package() {
  cd "$pkgname-topgit-$pkgver"
  make prefix=/usr cmddir=/usr/lib/topgit DESTDIR="$pkgdir" install
}
