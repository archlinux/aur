# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpvoid
pkgver=1.0.0
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary void Linux"
arch=('any')
url="https://github.com/tmplinux/tmpvoid"
license=('MIT')
depends=('bash' 'tar' 'xz' 'curl' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/tmplinux/tmpvoid/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpvoid-$pkgver" 
  install -Dm755 tmpvoid "$pkgdir/usr/bin/tmpvoid"
}
