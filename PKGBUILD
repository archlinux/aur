# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=emacs-ess
pkgver=1.8
pkgrel=1
epoch=2
pkgdesc="Emacs Speaks Statistics: A Universal Interface for Statistical Analysis"
url="http://ess.r-project.org/"
arch=('any')
license=('GPL')
depends=('emacs' 'r')
makedepends=('wget')
install=ess.install
source=("https://github.com/emacs-ess/ESS/archive/refs/tags/ESSRv${pkgver}.tar.gz")
sha256sums=('7046b2011bf960a732d74943de5a8bd93dd6b1f68389d545fe6eeff5fd09c3d0')

package() {
  cd "ESS-ESSRv$pkgver"
  make DESTDIR="$pkgdir"/usr INFODIR="$pkgdir"/usr/share/info/ install
}
