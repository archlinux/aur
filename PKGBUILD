# Maintainer: spaceslug <me at spaceslug dot no>
_base=mouse-actions
pkgname=$_base-cli-bin
pkgver=0.4.4
pkgrel=2
pkgdesc="Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the CLI only version!"
arch=('x86_64')
url="https://github.com/jersou/$_base"
license=('MIT')
depends=()
provides=($_base)
_filename=${_base}-v${pkgver}.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_filename}"
)
sha256sums=(
    '2cfc47a5fee31ca08714fe205ce07972e2b9a927465210b2dc796f05b003431b'
)
install=mouse-actions.install

package() {
    install -Dm755 mouse-actions "${pkgdir}/usr/bin/mouse-actions"
}
