# Maintainer: Jon Eyolfson <jon@eyl.io>
# Contributor: Gianmarco Brocchi <brocchi@poisson.phc.unipi.it>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=emacs-yasnippet
pkgver=0.12.2
pkgrel=1
pkgdesc="Yet another snippet extension for Emacs"
arch=('any')
url="https://github.com/joaotavora/yasnippet"
license=('MIT')
depends=('emacs')
source=("https://github.com/joaotavora/yasnippet/archive/${pkgver}.tar.gz")
sha256sums=('85f12b40107e0587a86680b24c2de9ae947ec9d9af67afe2d7eb9807be5a4a06')

package() {
  cd "${srcdir}/yasnippet-${pkgver}"
  install -d  "${pkgdir}/usr/share/emacs/site-lisp/yas"
  cp -a * "${pkgdir}/usr/share/emacs/site-lisp/yas"
}
