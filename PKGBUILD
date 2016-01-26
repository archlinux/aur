# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

pkgname=git-extras
pkgver=4.1.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="https://github.com/tj/git-extras"
license=('custom:MIT')
depends=('git')
source="https://github.com/tj/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('d4c028e2fe78abde8f3e640b70f431318fb28d82894dde22772efe8ba3563f85')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
}
