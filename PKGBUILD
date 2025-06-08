# Maintainer: nikevsoft <2e96po4bt@mozmail.com>

pkgname=marble-shell-theme
pkgver=48.0.1
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
arch=('any')
license=('GPL3')
source=(
    "https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.tar.xz"
)
sha256sums=(
    "7e392afb55a2e931a372f2438ddcd83968de7a1ace4ccb203d3da5215b417d17"
)

package() {
    rm readme.txt Marble-shell.tar.xz
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "${pkgdir}/usr/share/themes/"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
