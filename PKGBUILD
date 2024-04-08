# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=emacs-prop-menu-git
pkgver=20150728
pkgrel=1
pkgdesc="Compute pop-up menus from text and overlay properties"
arch=('any')
url="https://github.com/david-christiansen/prop-menu-el"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-prop-menu')
replaces=('emacs-prop-menu')

source=("git+https://github.com/david-christiansen/prop-menu-el")
b2sums=('SKIP')
_gitname="prop-menu-el"

package() {
  cd $_gitname

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/prop-menu
  cp -R $srcdir/prop-menu-el/*.el $pkgdir/usr/share/emacs/site-lisp/prop-menu
}

