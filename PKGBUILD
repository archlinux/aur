# Maintainer: SanderMoon <sander@sander.moon>
pkgname=local-brain-bin
pkgver=1.19.0
pkgrel=1
pkgdesc="Local Brain - Harmonized Tools for query_todos, search, and more"
arch=('x86_64')
url="https://github.com/SanderMoon/local-brain"
license=('MIT')
depends=()
source=("https://github.com/SanderMoon/local-brain/releases/download/v${pkgver}/local-brain_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('5c2bdd159af3d1cc9cc1932bf6c286e5ee617970f104dfe42c4279e6777f0b08')

package() {
  # Install the binary 'brain' to /usr/bin/
  install -Dm755 "${srcdir}/brain" "${pkgdir}/usr/bin/brain"
}
