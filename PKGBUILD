# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com
# Contributor: Mort Yao <soi@mort.ninja>

pkgname=emacs-idris-mode-git
pkgver=20150609
pkgrel=4
pkgdesc="Major mode for editing Idris."
arch=('any')
url="https://github.com/idris-hackers/idris-mode"
license=('GPL-3.0-or-later')
depends=('emacs' 'emacs-prop-menu')
makedepends=('git')
provides=('emacs-idris-mode')
conflicts=('emacs-idris-mode')
install=$pkgname.install

source=("git+https://github.com/idris-hackers/idris-mode")
b2sums=('SKIP')
_gitname="idris-mode"

package() {
  cd $_gitname

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/idris-mode
  cp -R $srcdir/idris-mode/*.el $pkgdir/usr/share/emacs/site-lisp/idris-mode
}
