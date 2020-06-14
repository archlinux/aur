# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=ibus-helakuru
pkgver=1.0
pkgrel=1
arch=("x86_64")
pkgdesc="Helakuru - Digital Sinhala Keyboard"
url="helakuru.lk"
license=("custom")
depends=("ibus" "ibus-m17n")
source=("helakuru-v1.0.tar.gz")
sha256sums=("a691ef3e10be9ab4c9a22b210776211f5e772681d551f3961463c47b5af54046")

package () {

    # INSTALL ( icons )
    install -Dm644 "${srcdir}"/icons/si-helakuru-phonetic.png -t "${pkgdir}"/usr/share/m17n/icons/

    # INSTALL ( min )
    install -Dm644 "${srcdir}"/si-helakuru-phonetic.mim -t "${pkgdir}"/usr/share/m17n/
    install -Dm644 "${srcdir}"/si-helakuru-wijesekara.mim -t "${pkgdir}"/usr/share/m17n/

}