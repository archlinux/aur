# Maintainer: ctech12 <https://aur.archlinux.org/account/ctech12>
pkgname=upower-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRC service script for UPower"
arch=('any')
url="https://aur.archlinux.org/packages/upower-openrc"
license=('MIT')
source=("upower")
depends=('openrc' 'upower')
sha256sums=('02d8479a3eaad0b321489f64a492aaa4030ccc6ac51604cea8243118aa18a0cb')

package() {
    install -Dm755 "${srcdir}/upower" "${pkgdir}/etc/init.d/upower"
}