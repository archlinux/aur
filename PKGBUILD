# Maintainer: graygraygray
pkgname=shackle
pkgver=0.1.0
pkgrel=1
pkgdesc="A modular, cyberpunk-inspired shell framework (Stable Release)"
arch=('any')
url="https://codeberg.org/graygraygray/shackle"
license=('GPL3')
depends=('quickshell' 'qt6-wayland')
provides=('shackle')
conflicts=('shackle-git') # This prevents logic collisions... ee~
# For now, we point to your main branch archive until you make a 'Tag'
source=("https://codeberg.org/graygraygray/shackle/archive/main.tar.gz")
sha256sums=('SKIP') # Use 'SKIP' just for today to claim it quickly

package() {
  cd "shackle"
  install -Dm644 README.md "$pkgdir/usr/share/doc/shackle/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/shackle/LICENSE"
}
