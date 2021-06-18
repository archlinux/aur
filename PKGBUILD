# Maintainer: hamki <hamki.do2000@gmail.com> 
# Contributor: Jon Eyolfson <jon@eyl.io>
# Contributor: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-yasnippet
pkgver=0.14.0
pkgrel=1
pkgdesc="Yet another snippet extension for Emacs"
arch=('any')
url="https://github.com/joaotavora/yasnippet"
license=('MIT')
depends=('emacs')
source=("https://github.com/joaotavora/yasnippet/archive/${pkgver}.tar.gz")
sha256sums=('08ebce82111e51371737f08b22271b63071ba8c6fa6ab98d4fbd573f1e9725da')

package() {
  cd "${srcdir}/yasnippet-${pkgver}"
  install -d  "${pkgdir}/usr/share/emacs/site-lisp/yasnippet"
  cp -a * "${pkgdir}/usr/share/emacs/site-lisp/yasnippet"
}
