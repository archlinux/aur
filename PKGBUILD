# Maintainer: Stefan Tatschner <stefan.tatschner@gmail.com>
pkgname=git-extras
pkgver=1.8.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source="https://github.com/visionmedia/${pkgname}/archive/${pkgver}.tar.gz"
md5sums=('3f05a8ea87afa6780eece3d34a690ee5')
sha256sums=('80ef21860809167324828da90d9cafff4f49c79096c63e0d7d104d0e6db849ff')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
