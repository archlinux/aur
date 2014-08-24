# Maintainer: Stefan Tatschner <stefan.tatschner@gmail.com>
pkgname=git-extras
pkgver=1.9.1
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source="https://github.com/visionmedia/${pkgname}/archive/${pkgver}.tar.gz"
md5sums=('adf086d3d5319dca9954a6cb66a0f2aa')
sha256sums=('236a9103b84b7b1701fcb72d6056041745b8e8726481f73703d17293196ec64c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
