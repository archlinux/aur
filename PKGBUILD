# Maintainer: hamki <hamki.do2000@gmail.com> 
pkgname=emacs-yasnippet-snippets
pkgver=0.24
pkgrel=1
pkgdesc="This repository contains the official collection of snippets for yasnippet."
arch=('any')
url="https://github.com/AndreaCrotti/yasnippet-snippets"
license=('GPL3')
depends=('emacs')
source=("https://github.com/AndreaCrotti/yasnippet-snippets/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c971fd201179c6e089f11abedddd03b689266524ce5ecd1dfc9a092478c46319')

package() {
  cd "${srcdir}/yasnippet-snippets-${pkgver}"
  install -d  "${pkgdir}/usr/share/emacs/site-lisp/yasnippet-snippets"
  cp -a * "${pkgdir}/usr/share/emacs/site-lisp/yasnippet-snippets"
}
