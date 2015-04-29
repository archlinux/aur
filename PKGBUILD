# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

pkgname=git-extras
pkgver=3.0.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="https://github.com/tj/git-extras"
license=('custom:MIT')
depends=('git')
source="https://github.com/tj/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('490742428824d6e807e894c3b6612be37a9a9a4e8fbea747d1813e5d62b2a807')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
