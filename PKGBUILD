# Maintainer: Chris Zimmermann <monochromec@gmail.com>
#
pkgname=emacs-go-mode.el
pkgver=1.4.0
pkgrel=1
pkgdesc="Go mode for emacs"
arch=(any)
conflicts=('')
license=('GPL')
source=(https://github.com/dominikh/go-mode.el/archive/v$pkgver.tar.gz)
url='https://github.com/dominikh/go-mode.el'
#
sha256sums=('31365aa8b220ca67e6fb24fa197e99121a6db815690df731df2f56915805935d')

package() {
  mv go-mode.el-$pkgver $pkgname-$pkgver
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode.el $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode-autoloads.el $pkgdir/usr/share/emacs/site-lisp/go-mode
}  
