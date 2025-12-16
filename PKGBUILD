# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpdebian
pkgver=1.2.3
pkgrel=1
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
