# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpfedora
pkgver=1.2.1
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary Fedora"
arch=('any')
url="https://github.com/TheOddCell/tmpfedora"
license=('MIT')
depends=('bash' 'dnf5' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/TheOddCell/tmpfedora/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpfedora-$pkgver" 
  install -Dm755 tmpfedora "$pkgdir/usr/bin/tmpfedora"
}
