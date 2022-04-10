# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=tachidesk-jui-bin
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance.'
pkgver=1.3.0
pkgrel=2
arch=('x86_64')
url='https://github.com/Suwayomi/Tachidesk-JUI'
license=('MPL2')
depends=("jre-openjdk>=17")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/Suwayomi/Tachidesk-JUI/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('28eeb9f98929949546fc97df36617f4f7d0c275c24618ce90dee59288a22a0df')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    install -Dm644 "$pkgdir/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Tachidesk-JUI.desktop"  -t "$pkgdir/usr/share/applications/"
}

