# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.10.0
pkgrel=2
pkgdesc="A plugin that provides a dark theme for keepass"
arch=('x86_64' 'aarch64')
url="https://github.com/xatupal/KeeTheme"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")
sha256sums=('56136b3fc96d6100935bac9a67e67b44eda3056749b8f40cf897cba534f5afd1')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
