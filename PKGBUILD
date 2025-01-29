# Maintainer: buding <1259085392z@gmail.com>
pkgname=catmatrix-forever
pkgver=1.2
pkgrel=2
pkgdesc="A memorial script for my friend catmatrix"
arch=('any')
url="https://github.com/valkyrie-lab/catmatrix-forever"
license=('MIT')
depends=('bash' 'chafa')
makedepends=('git')
source=("git+https://github.com/valkyrie-lab/catmatrix-forever.git")

package() {
  cd "$srcdir/$pkgname"
  
  install -Dm755 catmatrix.sh "$pkgdir/usr/bin/catmatrix"
  
  install -Dm644 images/catmatrix.jpg "$pkgdir/usr/share/catmatrix-forever/images/catmatrix.jpg"

  install -d "$pkgdir/usr/share/doc/catmatrix-forever"

  install -Dm644 README.md "$pkgdir/usr/share/doc/catmatrix-forever/README.md"
}

sha256sums=('SKIP')
