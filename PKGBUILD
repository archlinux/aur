# Maintainer: Alexander Inglessi <inglessi at glsk dot net>

pkgname=ttf-liter
pkgver=1.004
pkgrel=1
pkgdesc="Functional neo-grotesque font designed to be a typesetting workhorse"
arch=(any)
url="https://github.com/skugiz/liter"
license=("OFL-1.1")
source=("${url}/releases/download/Latest/Stable.Release.${pkgver}.zip"
        "https://raw.githubusercontent.com/skugiz/liter/refs/heads/main/OFL.txt")
sha256sums=("da8cf5b87bdaa5eb50566f37a8e684f888b0cb9e0d2e1cfda24231df5e7b0997"
            "3e12fb44d6ae7f513c44d182db1bbd0fa075408cda1b7cbdb2b74556be804af2")

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 "$srcdir/fonts/ttf"/*.ttf $pkgdir/usr/share/fonts/TTF
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt
}
