# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=24.01.1
pkgrel=1
epoch=2
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL-3.0-only')
depends=('emacs' 'r')
makedepends=()
install=ess.install
source=("https://github.com/emacs-ess/ESS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72ec1b81bdec34fd8f48ae15342ca8273c317012794195103deeaa58a7721f90')

package() {
  cd "ESS-$pkgver"
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
