# Maintainer: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Fox Kiester <noct[at]openmailbox[dot]org>

pkgname=tdrop
pkgver=0.4.0
pkgrel=2
pkgdesc="Glorified WM-independent dropdown creator"
arch=('any')
url="https://github.com/noctuid/tdrop"
license=('BSD')
depends=('coreutils' 'gawk' 'grep' 'procps-ng' 'xdotool' 'xorg-xprop' 'xorg-xwininfo')
optdepends=('tmux: session starting support'
            'xorg-xrandr: multiple monitor resizing support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/noctuid/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef4c644ad6c2c350b2e0f97ae2712e9871e13a6baef9065bcc1d8125eb073bb1')

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
