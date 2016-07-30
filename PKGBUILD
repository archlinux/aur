# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=emacs-langtool
pkgver=1.5.1
pkgrel=1
pkgdesc="LanguageTool for Emacs"
arch=('any')
url="https://github.com/mhayashi1120/Emacs-langtool"
license=('GPL')
depends=('emacs' 'languagetool')
options=(!emptydirs)

source=("https://github.com/mhayashi1120/Emacs-langtool/archive/$pkgver.tar.gz")
md5sums=('47e8eaf90f39044bd761360604b8de1f')

package() {
  cd "$srcdir"/Emacs-langtool-$pkgver
  install -D -m644 langtool.el "${pkgdir}/usr/share/emacs/site-lisp/langtool.el"
}

