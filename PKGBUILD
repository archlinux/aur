pkgname=arch-package
pkgver=1.0.0
pkgrel=1
pkgdesc="A professional-grade AUR helper and driver manager"
arch=('any')
url="https://github.com/TheRealWoculus/arch-package"
license=('MIT')
depends=('pacman' 'git' 'jq')
source=("arch-package-1.0.0.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/arch-package" "$pkgdir/usr/bin/arch-package"
}
