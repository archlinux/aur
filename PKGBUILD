pkgname=arch-package
pkgver=1.0.0
pkgrel=7
pkgdesc="A professional-grade AUR helper and driver manager"
arch=('any')
url="https://github.com"
license=('MIT')
depends=('pacman' 'git' 'jq')
source=("arch-package-1.0.0.tar.gz::https://githubusercontent.com")
sha256sums=('SKIP')

package() {
  find "$srcdir" -type f -name "arch-package" -exec install -Dm755 "{}" "$pkgdir/usr/bin/arch-package" \;
}
