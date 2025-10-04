# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=libtmplinux
pkgver=1.0.0
pkgrel=1
pkgdesc="Common code for the tmplinux suite."
arch=('any')
url="https://github.com/tmplinux/libtmplinux"
license=('MIT')
depends=('bash' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/tmplinux/libtmplinux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/libtmplinux-$pkgver" 
  install -Dm755 libtmplinux.sh "$pkgdir/usr/lib/libtmplinux.sh"
}
