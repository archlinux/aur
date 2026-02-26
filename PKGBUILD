# Maintainer: SanderMoon <sander@sander.moon>
pkgname=local-brain-bin
pkgver=1.17.6
pkgrel=1
pkgdesc="Local Brain - Harmonized Tools for query_todos, search, and more"
arch=('x86_64')
url="https://github.com/SanderMoon/local-brain"
license=('MIT')
depends=()
source=("https://github.com/SanderMoon/local-brain/releases/download/v${pkgver}/local-brain_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4c89a0a2651f89a67a42363bfeda47db65f94fd2ca5a9d1d1d741ddc97b6437a')

package() {
  # Install the binary 'brain' to /usr/bin/
  install -Dm755 "${srcdir}/brain" "${pkgdir}/usr/bin/brain"
}
