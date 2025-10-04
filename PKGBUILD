# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmparch
pkgver=3.1.2
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary Arch Linux"
arch=('any')
url="https://github.com/TheOddCell/tmparch"
license=('MIT')
depends=('bash' 'arch-install-scripts' 'shadow' 'util-linux' 'systemd' 'squashfs-tools' 'libtmplinux')
makedepends=()
source=("https://github.com/TheOddCell/tmparch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmparch-$pkgver" 
  install -Dm755 tmparch "$pkgdir/usr/bin/tmparch"
}
