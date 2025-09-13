# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpgentoo
pkgver=1.0.0
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary gentoo Linux"
arch=('any')
url="https://github.com/TheOddCell/tmpgentoo"
license=('MIT')
depends=('bash' 'tar' 'ncurses' 'xz' 'curl' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/TheOddCell/tmpgentoo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpgentoo-$pkgver" 
  install -Dm755 tmpgentoo "$pkgdir/usr/bin/tmpgentoo"
}
