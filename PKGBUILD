# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-yasnippet
pkgver=0.11.0
pkgrel=1
pkgdesc="Yet another snippet extension for Emacs"
arch=('any')
url="https://github.com/joaotavora/yasnippet"
license=('MIT')
depends=('emacs')
source=("https://github.com/joaotavora/yasnippet/archive/${pkgver}.tar.gz")
sha256sums=('05c7d47be7296add65519e2ed4f588120a60290635ebdb1a3e2b01376735b195')

package() {
  cd "${srcdir}/yasnippet-${pkgver}"
  install -d  "${pkgdir}/usr/share/emacs/site-lisp/yas"
  cp -a * "${pkgdir}/usr/share/emacs/site-lisp/yas"
}
