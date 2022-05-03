# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.9.10
pkgrel=1
pkgdesc="A plugin that provides a dark theme for keepass"
arch=('x86_64')
url="https://www.gnu.org/software/patch/patch.html"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")

sha256sums=('77a3ec13e2b0b6a0e95a1adb78cf4b4af8d08123d42c9de8737d8ff80e1a91db')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
