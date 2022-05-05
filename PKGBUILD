# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Fox Kiester <noct[at]openmailbox[dot]org>

pkgname=tdrop
pkgver=0.5.0
pkgrel=1
pkgdesc="Glorified WM-independent dropdown creator"
arch=('any')
url="https://github.com/noctuid/tdrop"
license=('BSD')
depends=('coreutils' 'gawk' 'grep' 'procps-ng' 'xdotool' 'xorg-xprop' 'xorg-xwininfo')
optdepends=('tmux: session starting support'
            'xorg-xrandr: multiple monitor resizing support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/noctuid/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ac37c76cb936d8e4c1c0aba5874999e09b8acbe07a2e23e8181114bd4a2a0a5d')

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
