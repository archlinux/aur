# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-websocket
pkgver=1.12
pkgrel=1
pkgdesc="A websocket implementation in elisp, for emacs."
arch=('any')
url="https://github.com/ahyatt/emacs-websocket"
license=('GPL2')
depends=('emacs')
makedepends=()
source=("https://github.com/ahyatt/emacs-websocket/archive/${pkgver}.tar.gz")
install=${pkgname}.install
noextract=('GPL3')
sha256sums=('be24796ad47335ce91ec3e142d52ee07f00ca79078312a0759bce135e1bf414e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 644 websocket.el "${pkgdir}"/usr/share/emacs/site-lisp/websocket/websocket.el
}
