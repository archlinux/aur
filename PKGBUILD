# Maintainer: Stefan Tatschner <stefan.tatschner@gmail.com>
pkgname=git-extras
pkgver=1.9.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source="https://github.com/visionmedia/${pkgname}/archive/${pkgver}.tar.gz"
md5sums=('7ac28233dad49bfc646cffc406d977f6')
sha256sums=('53c4f9998222937fec07cc02dad1d7b87f8dc10b22d84698702fd96c4729a755')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
