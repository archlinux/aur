# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=25.01.0
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
sha256sums=('fa83adc48b71a242a2d2c63e27b4d3b98398a0111340ef4defbdb784602db1c3')

package() {
  cd "ESS-$pkgver"
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
