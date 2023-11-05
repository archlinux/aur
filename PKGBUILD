# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=marble-shell-theme
pkgver=2023_07_25
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
arch=('any')
license=('GPL3')
source=("https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.tar.xz")
sha256sums=('98c9da17c43dc869af5abb6b8d3107bfe111d4c9aa7c4c7b2805ff29b60b6004')
options=(!strip)

package() {
    rm readme.txt Marble-shell.tar.xz
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "$pkgdir/usr/share/themes/"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
