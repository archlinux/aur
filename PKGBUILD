# Maintainer: Ariel Fellous <ariel.fellous@gmail.com>
pkgname=touchpad-toggle-xinput
pkgver=1
pkgrel=1
pkgdesc="script to toggle the touchpad on and off using xinput"
arch=(any)
license=('custom:none')
depends=("bash" "grep" "sed" "xorg-xinput")
source=("touchpad-toggle")
md5sums=("e7da7000606cc3ae49ed7781ad00ae56")

package() {
  msg "Installing script file"
  install -m755 -d ${pkgdir}/usr/bin
  install -m655 touchpad-toggle ${pkgdir}/usr/bin/touchpad-toggle
}
