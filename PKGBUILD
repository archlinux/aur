# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpstali
pkgver=1.0.1
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary Stali"
arch=('any')
url="https://github.com/TheOddCell/tmpstali"
license=('MIT')
depends=('bash' 'git' 'shadow' 'util-linux' 'systemd' 'squashfs-tools')
makedepends=()
source=("https://github.com/TheOddCell/tmpstali/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpstali-$pkgver" 
  install -Dm755 tmpstali "$pkgdir/usr/bin/tmpstali"
}
