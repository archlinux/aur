# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=tachidesk-jui-bin
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance.'
pkgver=1.2.1
pkgrel=2
arch=('x86_64')
url='https://github.com/Suwayomi/Tachidesk-JUI'
license=('MPL2')
depends=("jre-openjdk>=17")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/Suwayomi/Tachidesk-JUI/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('14fda889f50fcc479f3861faab62d30a6c6ac0ab7dc9760d0283a5f14e944bac')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    install -Dm644 "$pkgdir/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Tachidesk-JUI.desktop"  -t "$pkgdir/usr/share/applications/"
}

