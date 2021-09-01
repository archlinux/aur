# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=emacs-ctags-update
pkgver='1.1'
pkgrel='1'
pkgdesc="Emacs functions for auto update of TAGS files using ctags"
url="https://github.com/jixiuf/ctags-update"
arch=('any')
license=('GPL3')
depends=('emacs' 'ctags')
makedepends=('git')
provides=('emacs-ctags-update')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jixiuf/ctags-update/archive/v${pkgver}.tar.gz")
sha256sums=('3a0f045da4e657c7d338f4bb419015822e115f279dfec8cc6204bf27e2f42048')
install=${pkgname}.install

package() {
  cd ctags-update-${pkgver}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/ctags-update
  install -m644 *.el "${pkgdir}"/usr/share/emacs/site-lisp/ctags-update/
}