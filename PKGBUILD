# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.9.12
pkgrel=1
pkgdesc="A plugin that provides a dark theme for keepass"
arch=('x86_64')
url="https://github.com/xatupal/KeeTheme"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")
sha256sums=('ed7c6b07a300189b7edc4cd5ce54b1ed73ab95618e9512a1e36699bf1b8e66b8')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
