# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-web-server
pkgver=0.1.0
pkgrel=1
pkgdesc="web server running Emacs Lisp handlers."
arch=('any')
url="https://github.com/eschulte/emacs-web-server"
license=('GPL3')
depends=('emacs')
makedepends=()
source=("https://github.com/eschulte/emacs-web-server/archive/version-${pkgver}.tar.gz")
noextract=()
sha256sums=('be24796ad47335ce91ec3e142d52ee07f00ca79078312a0759bce135e1bf414e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 644 web-server.el "${pkgdir}"/usr/share/emacs/site-lisp/web-server/web-server.el
}
