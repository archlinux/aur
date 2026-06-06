# Maintainer: Yassine <cherradiyacyn@icloud.com>

pkgname=microbit-udev
pkgver=1.0.0
pkgrel=1
pkgdesc="Udev rules allowing WebUSB access for BBC micro:bit in web editors (Makeblock, MakeCode)"
arch=('any')
url="https://codeberg.org/cherradiyacyn/microbit-aur"
license=('unlicense')
source=("60-microbit.rules::https://codeberg.org/cherradiyacyn/microbit-aur/raw/branch/master/60-microbit.rules")
sha256sums=('1e7ef518d235b914bd863be38641bc9613742364d998fa9db770e615aa464903')

package() {
    install -Dm644 "${srcdir}/60-microbit.rules" "${pkgdir}/usr/lib/udev/rules.d/60-microbit.rules"
}
