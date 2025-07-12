# Contributor: Karel-van-de-plassche <karelvandeplassche@gmail.com>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=keepass-keetheme
pkgver=0.10.7
pkgrel=1
pkgdesc="plugin that provides a dark theme for keepass"
arch=('any')
url="https://github.com/xatupal/KeeTheme"
license=('MIT')
depends=('keepass')
source=("https://github.com/xatupal/KeeTheme/releases/download/v${pkgver}/KeeTheme.plgx")
sha256sums=('4b131a8b58f0c9dca259ff915e637407151ccfc39fb7fa4fc9cf077dc9c5ff96')

package() {
    path="usr/share/keepass/Plugins"
    install -d "${pkgdir}/${path}"
    install -m644 "${srcdir}/KeeTheme.plgx" "${pkgdir}/${path}/KeeTheme.plgx"
}
