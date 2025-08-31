# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=opww
pkgver=2.1.0
pkgrel=5
pkgdesc="Odd Pacman Wrapper Wrapper"
arch=('any')
url="https://github.com/TheOddCell/opww"
license=('MIT')
depends=('python3' 'less' 'base-devel' 'git')
makedepends=()
source=("https://github.com/TheOddCell/opww/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/opww-$pkgver" 
  install -Dm755 opww "$pkgdir/usr/bin/opww"
}
