# Maintainer: Yunchuan "Winslow" Hu <i@winsloweric.com, winslows@student.ubc.ca>
pkgname=emacs-ediprolog
pkgver=2.3
pkgrel=1
pkgdesc="Emacs Does Interactive Prolog"
arch=('any')
url="https://www.metalevel.at/ediprolog/"
license=('GPL')
depends=('emacs')
source=("https://www.metalevel.at/ediprolog/ediprolog.el")
sha256sums=('SKIP')
groups=('prolog' 'emacs')
package() {
    install -Dm644 ediprolog.el "$pkgdir/usr/share/emacs/site-lisp/ediprolog.el"
}
