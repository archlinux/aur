# Maintainer: zandimna <zandimna@autistici.org>
pkgname=stayawake-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Advanced wakeup alarm system written in PyQt5"
arch=("x86_64")
url="https://github.com/PolyphasicDevTeam/stayawake"
license=('GPL3')
depends=('mpg123' 'pulseaudio')
source=("https://github.com/PolyphasicDevTeam/stayawake/releases/download/0.5.1/stayawake-0.5.1.tar.xz")

package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
    install -Dm644 "${pkgname%-bin}.png" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 StayAwake.desktop \
        "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgname%-bin}.conf" -t "$pkgdir/etc"
}
md5sums=('3fe1e1ba5fd3b7fd789923a68cab0d59')
