# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=emacs-langtool
pkgver=2.0.4
pkgrel=1
pkgdesc="LanguageTool for Emacs"
arch=('any')
url="https://github.com/mhayashi1120/Emacs-langtool"
license=('GPL')
depends=('emacs' 'languagetool')
options=(!emptydirs)

source=("https://github.com/mhayashi1120/Emacs-langtool/archive/$pkgver.tar.gz")
sha512sums=('74c0579cfb5e39db0835d458eb64b78533b8df1c733bd34edbb5c06f1ce80bcc36315f4bbdd46d7ca00d85df9ec7cd680f2f665933c87a3a348d85e005a194de')

package() {
  cd "$srcdir"/Emacs-langtool-$pkgver
  install -D -m644 langtool.el "${pkgdir}/usr/share/emacs/site-lisp/langtool.el"
}

