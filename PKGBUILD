# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=marble-shell-theme
pkgver=46.0.2
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
arch=('any')
license=('GPL3')
source=(
    "https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.tar.gz"
)
sha256sums=(
    "d64189064b54f5f21a7382e71619ce7c9822541eed0dda62850a35014804e693"
)

package() {
    rm readme.txt Marble-shell.tar.gz
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "$pkgdir/usr/share/themes/"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
