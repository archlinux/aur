# Maintainer: Chris Zimmermann <monochromec@gmail.com>
#
pkgname=emacs-go-mode
replaces=('go-mode.el')
pkgver=1.5.0
pkgrel=1
pkgdesc="Go mode for emacs"
arch=(any)
conflicts=('')
license=('GPL')
source=(https://github.com/dominikh/go-mode.el/archive/v$pkgver.tar.gz)
url='https://github.com/dominikh/go-mode.el'
#
sha256sums=('d54a4afac1658082da1f26bab486c346262e5b185e6463cfe316a3e5e57ab6a9')

package() {
  mv go-mode.el-$pkgver $pkgname-$pkgver
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode.el $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode-autoloads.el $pkgdir/usr/share/emacs/site-lisp/go-mode
}  
