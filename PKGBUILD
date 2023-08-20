# Maintainer: spaceslug <me at spaceslug dot no>
_base=mouse-actions
pkgname=$_base-gui-bin
pkgver=0.4.4
pkgrel=2
pkgdesc="Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the GUI version but you can still use CLI!"
arch=('x86_64')
url="https://github.com/jersou/$_base"
license=('MIT')
depends=(gtk3 webkit2gtk)
provides=($_base)
_filename=${_base}-gui-v${pkgver//_/-}.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_filename}"
)
sha256sums=(
    '4016df9f5a35991169110ff4b2d751f2c2ee4f09d0bf1e5e5144b7912a96635b'
)
install=mouse-actions.install

package() {
    install -Dm755 mouse-actions-gui "${pkgdir}/usr/bin/mouse-actions-gui"
}
