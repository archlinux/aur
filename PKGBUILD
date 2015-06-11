# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <gianni@rootcube.net>
# Contributor: Gour <gour@atmarama.net>

pkgname=emacs-d-mode  
pkgver=2.0.6
pkgrel=1 
pkgdesc="Emacs major mode for the D programming language"
url="http://www.wikiservice.at/d/wiki.cgi?EditorSupport/EmacsEditor"
arch=('any')
license=('GPL2')
depends=()
install=$pkgname.install
source=(https://github.com/Emacs-D-Mode-Maintainers/Emacs-D-Mode/tarball/2.0.6)
sha256sums=('e15b325be67dd2c515ca79113d808f9d84f4e65db02167d0423d14d17c8c7109')

package() {
  cd "$srcdir/"

  install -m755 -d "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 Emacs-D-Mode-Maintainers-Emacs-D-Mode-*/d-mode.el "$pkgdir/usr/share/emacs/site-lisp"
}

