pkgname=kirasay
pkgver=2.0.0
pkgrel=1
pkgdesc="Kira says things in ASCII with customizable bubbles"
arch=('any')
url="https://github.com/s4nj1th/kirasay"
license=('MIT')
depends=('perl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgvermakepkg --printsrcinfo > .SRCINFO"
  install -Dm755 kirasay "$pkgdir/usr/bin/kirasay"
}
