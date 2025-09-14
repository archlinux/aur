# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=untmp
pkgver=1.1.0
pkgrel=1
pkgdesc="Take an tmplinux container and make it no longer temporary."
arch=('any')
url="https://github.com/TheOddCell/untmp"
license=('MIT')
depends=('bash' 'arch-install-scripts' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/tmplinux/untmp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/untmp-$pkgver" 
  install -Dm755 untmp "$pkgdir/usr/bin/untmp"
  install -Dm755 qboot "$pkgdir/usr/bin/qboot"
}
