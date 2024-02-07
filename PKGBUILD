# Contributor: Mort Yao <soi@mort.ninja>

pkgname=emacs-idris-mode-git
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for editing Idris."
arch=('any')
url="https://github.com/idris-hackers/idris-mode"
license=('GPL3')
depends=('emacs')
makedepends=('git')
provides=('emacs-idris-mode')
replaces=('emacs-idris-mode')
install=$pkgname.install

source=("git+https://github.com/idris-hackers/idris-mode")
b2sums=('SKIP')
_gitname="idris-mode"

package() {
  cd $_gitname

  mkdir -p $pkgdir/usr/share/emacs/site-lisp/idris-mode
  cp -R $srcdir/idris-mode/*.el $pkgdir/usr/share/emacs/site-lisp/idris-mode
}
