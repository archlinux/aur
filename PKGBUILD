# Maintainer: Chris Zimmermann <monochromec@gmail.com>
#
pkgname=go-mode.el
pkgver=1.3.1
pkgrel=1
pkgdesc="Go mode for emacs"
arch=(any)
conflicts=('')
license=('GPL')
source=(https://github.com/dominikh/go-mode.el/archive/v$pkgver.tar.gz)
url='https://github.com/dominikh/go-mode.el'
#
md5sums=('211b496be7d8235b264ca17d8c9033c6')

package() {
  cd ${startdir}/src/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode.el $pkgdir/usr/share/emacs/site-lisp/go-mode
  install -m644 go-mode-autoloads.el $pkgdir/usr/share/emacs/site-lisp/go-mode
}  
