# Maintainer: nikevsoft <2e96po4bt@mozmail.com>

pkgname=marble-shell-theme
pkgver=46.2.3
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
arch=('any')
license=('GPL3')
source=(
    "https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.tar.xz"
)
sha256sums=(
    "5eb0f3dcae1564b1eb5ae0a2b8b82432599317b1cf601c3bf8c9c703dfc32ba8"
)

package() {
    rm readme.txt Marble-shell.tar.xz
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "$pkgdir/usr/share/themes/"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
