# Maintainer: SanderMoon <sander@sander.moon>
pkgname=local-brain-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="Local Brain - Harmonized Tools for query_todos, search, and more"
arch=('x86_64')
url="https://github.com/SanderMoon/local-brain"
license=('MIT')
depends=()
source=("https://github.com/SanderMoon/local-brain/releases/download/v${pkgver}/local-brain_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('f75d625a325b180766ad81125b91b3f08ce84410467cd7b78730b3e3bc51d00e')

package() {
  # Install the binary 'brain' to /usr/bin/
  install -Dm755 "${srcdir}/brain" "${pkgdir}/usr/bin/brain"
}
