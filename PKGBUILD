# Maintainer: spaceslug <me at spaceslug dot no>
pkgname=mouse-actions
pkgver=0.4.4
pkgrel=1
pkgdesc="Mouse actions for X11 and Wayland. It's a mix between Easystroke and Compiz edge commands"
arch=('x86_64')
url="https://github.com/jersou/mouse-actions"
license=('MIT')
depends=(gtk3 webkit2gtk)
_filename=mouse-actions-gui-v${pkgver//_/-}.tar.gz 
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_filename}")
sha256sums=('4016df9f5a35991169110ff4b2d751f2c2ee4f09d0bf1e5e5144b7912a96635b')

package() {
    install -Dm755 mouse-actions-gui "${pkgdir}/usr/bin/mouse-actions-gui"
    echo "Remember to add your user to group 'input'. Ex 'sudo usermod -a -G input \$USER'"
}
