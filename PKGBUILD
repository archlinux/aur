pkgname=tmparch
pkgver=2.1.0
pkgrel=1
pkgdesc="Temporary Arch Linux"
arch=('any')
url="https://github.com/TheOddCell/tmparch"
license=('MIT')
depends=('bash' 'arch-install-scripts' 'shadow' 'util-linux' 'systemd')
makedepends=()
source=("https://github.com/TheOddCell/tmparch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmparch-$pkgver" 
  install -Dm755 tmparch "$pkgdir/usr/bin/tmparch"
}
