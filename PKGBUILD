# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=emacs-langtool
pkgver=1.3.1
pkgrel=1
pkgdesc="LanguageTool for Emacs"
arch=('any')
url="https://github.com/mhayashi1120/Emacs-langtool"
license=('GPL')
depends=('emacs' 'languagetool')
options=(!emptydirs)

source=("https://github.com/mhayashi1120/Emacs-langtool/archive/$pkgver.tar.gz")
md5sums=('4f6730d738e8b41a47c86ecad80af40a')

package() {
  cd "$srcdir"/Emacs-langtool-$pkgver
  install -D -m644 langtool.el "${pkgdir}/usr/share/emacs/site-lisp/langtool.el"
}

