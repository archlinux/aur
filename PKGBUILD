# Maintainer: Yassine CHERRADI <yassinec.org@protonmail.com>

pkgname=microbit-udev
pkgver=1.0.0
pkgrel=4
pkgdesc="A udev rule that enables WebUSB/WebHID communication with the BBC micro:bit"
arch=('any')
url="https://gitlab.com/yassinec.org/microbit-udev"
license=('MIT')
source=("60-microbit.rules::https://gitlab.com/yassinec.org/microbit-udev/-/raw/main/60-microbit.rules"
        "LICENSE::https://gitlab.com/yassinec.org/microbit-udev/-/raw/main/LICENSE")
sha256sums=('137c590e032612a2091c2ac8da3f281a045a18589f3a45f2516db6684c67ae2c'
            'dec9fc87d97523702198835b2b5905d3195bdbb85a480a912c5a0a7089b25e53')

package() {
    install -Dm644 "${srcdir}/60-microbit.rules" "${pkgdir}/usr/lib/udev/rules.d/60-microbit.rules"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
