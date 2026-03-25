# Maintainer: SanderMoon <sander@sander.moon>
pkgname=local-brain-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="Local Brain - Harmonized Tools for query_todos, search, and more"
arch=('x86_64')
url="https://github.com/SanderMoon/local-brain"
license=('MIT')
depends=()
source=("https://github.com/SanderMoon/local-brain/releases/download/v${pkgver}/local-brain_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('0362a62dd230b4be4e2ec16325fca0f0b9e4ecf179467896b25b5f236bddf5ae')

package() {
  # Install the binary 'brain' to /usr/bin/
  install -Dm755 "${srcdir}/brain" "${pkgdir}/usr/bin/brain"
}
