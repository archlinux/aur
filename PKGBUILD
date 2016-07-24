# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-yasnippet
pkgver=0.10.0
pkgrel=1
pkgdesc="Yet another snippet extension for Emacs"
arch=('any')
url="https://github.com/joaotavora/yasnippet"
license=('MIT')
depends=('emacs')
source=("https://github.com/joaotavora/yasnippet/archive/${pkgver}.tar.gz")
sha256sums=('3817fb04dc3a333e315fb5b50f8403620dc953d9c8494598e1b8a12843fa3ba8')

package() {
  cd "${srcdir}/yasnippet-${pkgver}"
  install -d  "${pkgdir}/usr/share/emacs/site-lisp/yas"
  cp -a * "${pkgdir}/usr/share/emacs/site-lisp/yas"
}
