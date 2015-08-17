# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>
pkgname=emacs-textile-mode
_pkgname=textile-mode
pkgver=6
pkgrel=2
pkgdesc="Emacs major mode for editing files in Textile markup"
arch=('i686' 'x86_64')
url="http://dev.nozav.org/textile-mode.html"
license=('GPL')
groups=()
depends=('emacs')
install=emacs-textile-mode.install
source=(http://dev.nozav.org/scripts/textile-mode.el)
noextract=()
md5sums=('cf663f90d0eff12260e3e3dd6ec72a50')

build() {
  # Install the mode for Emacs
  install -D -m644 $_pkgname.el $pkgdir/usr/share/emacs/site-lisp/$_pkgname.el
}
