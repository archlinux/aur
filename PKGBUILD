# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpsuse
pkgver=1.0.0
pkgrel=2
pkgdesc="Part of the tmplinux suite. Temporary OpenSUSE"
arch=('any')
url="https://github.com/TheOddCell/tmpsuse"
license=('MIT')
depends=('bash' 'zypper' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/TheOddCell/tmpsuse/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpsuse-$pkgver" 
  install -Dm755 tmpsuse "$pkgdir/usr/bin/tmpsuse"
}
