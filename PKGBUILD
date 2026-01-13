pkgname=katifetch
pkgver=13.1
pkgrel=1
pkgdesc="Fast and portable system information tool with ASCII logos"
arch=('any')
url="https://github.com/ximimoments/katifetch"
license=('MIT')
source=("https://github.com/ximimoments/katifetch/releases/download/13.1/katifetch-13.1.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/katifetch-13.1/katifetch-main"
  install -Dm755 katifetch.sh "$pkgdir/usr/bin/katifetch"
}
