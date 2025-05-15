# Maintainer: dashy-jngl <you@example.com>
pkgname=stardom-card
pkgver=0.1.0
pkgrel=2
pkgdesc="CLI tool to scrape and display Stardom event cards"
arch=('x86_64')
url="https://github.com/dashy-jngl/stardom-card"
license=('MIT')
depends=(python-requests python-beautifulsoup4 python-wcwidth python-deep-translator)
makedepends=('python-pip')
source=(https://github.com/dashy-jngl/stardom-card/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')  # replace with real sum if you like

build() {
  cd "$srcdir/stardom-card-${pkgver}"
  pip install --prefix="$pkgdir/usr" --no-deps --ignore-installed .
}

package() {
  # pip already installed everything into $pkgdir/usr
  :
}
