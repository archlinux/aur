# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

pkgname=git-extras
pkgver=4.0.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="https://github.com/tj/git-extras"
license=('custom:MIT')
depends=('git')
source="https://github.com/tj/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('4adaadc1f22f3240ae9607963ede29a5c010ae14b877b90c27d17d6b0c06f430')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
