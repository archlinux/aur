# Maintainer: Sergey M <tz4678@gmail.com>

pkgname=evine
pkgver=latest
pkgrel=1
pkgdesc="Interactive CLI Web Crawler."
arch=('x86_64')
url=https://github.com/saeeddhqan/evine
license=('GPL3')
depends=()
makedepends=()
provides=('evine')
conflicts=()
source=(
  'https://github.com/saeeddhqan/evine/releases/latest/download/evine_linux_amd64.tar.xz'
)
#noextract=()
sha256sums=('SKIP')

package() {
  install -Dm755 "$pkgname" -t "${pkgdir}/usr/bin"
}
