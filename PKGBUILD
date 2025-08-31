pkgname=tmpdebian
pkgver=1.0.2
pkgrel=2
pkgdesc="Part of the tmplinux suite. Temporary Debian"
arch=('any')
url="https://github.com/TheOddCell/tmpdebian"
license=('MIT')
depends=('bash' 'debootstrap' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/TheOddCell/tmpdebian/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpdebian-$pkgver" 
  install -Dm755 tmpdebian "$pkgdir/usr/bin/tmpdebian"
}
