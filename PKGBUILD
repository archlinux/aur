# Maintainer: Brandon Pollack <brandonpollack23@gmail.com>
pkgname=aion-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A keyboard-first terminal UI for Google Calendar"
arch=('x86_64')
url="https://github.com/brandonpollack23/aion"
license=('MIT')
provides=('aion-calendar')
conflicts=('aion-calendar')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.zst::https://github.com/brandonpollack23/aion/releases/download/v${pkgver}/aion-calendar-x86_64-unknown-linux-gnu.tar.zst")
sha256sums_x86_64=('4300d511346666bfcb979647a7324adfd011dd7842d1dd1d6971628642acc2f6')

package() {
    install -Dm755 "${srcdir}/aion-calendar" "${pkgdir}/usr/bin/aion-calendar"
}
