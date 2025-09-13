# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=tmpidlebox
pkgver=2.0.1
pkgrel=1
pkgdesc="Part of the tmplinux suite. Temporary Idlebox"
arch=('any')
url="https://github.com/TheOddCell/tmpidlebox"
license=('MIT')
depends=('bash' 'busybox' 'systemd')
makedepends=()
source=("https://github.com/TheOddCell/tmpidlebox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/tmpidlebox-$pkgver" 
  install -Dm755 tmpidlebox "$pkgdir/usr/bin/tmpidlebox"
}
