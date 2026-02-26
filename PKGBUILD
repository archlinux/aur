# Maintainer: SanderMoon <sander@sander.moon>
pkgname=local-brain-bin
pkgver=1.17.7
pkgrel=1
pkgdesc="Local Brain - Harmonized Tools for query_todos, search, and more"
arch=('x86_64')
url="https://github.com/SanderMoon/local-brain"
license=('MIT')
depends=()
source=("https://github.com/SanderMoon/local-brain/releases/download/v${pkgver}/local-brain_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('10aee022af6ba72487a239eaea460e2ffe737703df26a57fde5aaa76430676e4')

package() {
  # Install the binary 'brain' to /usr/bin/
  install -Dm755 "${srcdir}/brain" "${pkgdir}/usr/bin/brain"
}
