# Contributor: Nathan Owe <nathan.aur at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-rtf-mode
pkgver=1.1
pkgrel=3
pkgdesc="Emacs mode for viewing/editing RTF files"
arch=('any')
url="http://www.emacswiki.org/emacs/rtf-mode.el"
license=('GPL')
depends=('emacs')
source=("http://www.emacswiki.org/emacs/download/rtf-mode.el")
sha256sums=('aeac654763ba336dbf8efb312e19a7b52db07bb3f7ee18d861556ba9a3def57f')

build() {
  emacs -batch -f batch-byte-compile rtf-mode.el
}

package() {
  install -Dm644 rtf-mode.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/rtf-mode.el
  install -Dm644 rtf-mode.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/rtf-mode.elc
}
