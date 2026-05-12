pkgname=arch-package
pkgver=1.0.0
pkgrel=2
pkgdesc="A professional-grade AUR helper and driver manager"
arch=('any')
url="https://github.com/TheRealWoculus/arch-package"
license=('MIT')
depends=('pacman' 'git' 'jq')
source=("https://github.com")
sha256sums=('SKIP')

package() {
  # This find command ensures the script is found regardless of folder structure
  find "$srcdir" -type f -name "arch-package" -exec install -Dm755 "{}" "$pkgdir/usr/bin/arch-package" \;
}
