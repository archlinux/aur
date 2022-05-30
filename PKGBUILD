# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.9.11
pkgrel=2
pkgdesc="A plugin that provides a dark theme for keepass"
arch=('x86_64')
url="https://github.com/xatupal/KeeTheme"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")

sha256sums=('96e31324241b2eb0a47a4ea3560f69214a425654df5a0ecde7e3d022c6538242')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
