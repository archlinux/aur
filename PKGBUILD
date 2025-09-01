# Maintainer: pandaxtc <uixtd883a@mozmail.com>
# Contributor: nikevsoft <2e96po4bt@mozmail.com>

pkgname=marble-shell-theme
pkgver=48.3.2
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
license=('GPL-3.0-only')
arch=('any')
source=(
    "https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.zip"
)
sha256sums=(
    "20609fe9f108946238d0cb1e7cd9389a99d2e6eef27980f054d421a5b90119c1"
)

package() {
    rm readme.txt Marble-shell.zip
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "${pkgdir}/usr/share/themes/"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
