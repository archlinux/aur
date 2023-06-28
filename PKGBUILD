# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.10.2
pkgrel=1
pkgdesc="plugin that provides a dark theme for keepass"
arch=('any')
url="https://github.com/xatupal/KeeTheme"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")
sha256sums=('e3886e0f8955ae826e7ea95a4896e89a40cabdc0e4a493c8d32bd5aa622090c3')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
