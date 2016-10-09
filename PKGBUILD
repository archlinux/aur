# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=git-extras
pkgver=4.2.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="https://github.com/tj/${pkgname}"
license=('custom:MIT')
depends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('53668af26c58e7866addbd2b14b29f63ee39029bdcee5f48957c4a958bdb225f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
}
