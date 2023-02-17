# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=tachidesk-jui-bin
pkgver=1.3.2
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance.'
arch=('x86_64')
url='https://github.com/Suwayomi/Tachidesk-JUI'
license=('MPL2')
depends=("jre-openjdk>=17")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/Suwayomi/Tachidesk-JUI/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('b1ca07aa86005a7d520e7cac29ebb475c48b71da095b30dba9181dbe4df7bc9f')

package() {
    tar -xf data.tar.xz -C "$pkgdir"
    install -Dm644 "$pkgdir/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Tachidesk-JUI.desktop"  -t "$pkgdir/usr/share/applications/"
}

