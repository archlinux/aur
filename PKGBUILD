# Maintainer: Raymo111 <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
pkgname=chromedriver
pkgver=130.0.6723.91
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for google-chrome)"
arch=('x86_64')
url="https://chromedriver.chromium.org/"
license=('BSD')
depends=(alsa-lib gtk3 libcups libxss libxtst nss xdg-utils)
optdepends=(google-chrome)
conflicts=(chromium)
source=("${pkgname}_${pkgver}_linux64.zip::https://storage.googleapis.com/chrome-for-testing-public/${pkgver}/linux64/${pkgname}-linux64.zip")
sha512sums=('bc0f21cf8f3b4668b89b194a898eb428558fa96cf676fbf15861b5736c0cc3c53f3a3a66d9f817aef401349e290676d3064c0cac28d49d120fe05b7b3ff0c0a5')
package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-linux64/$pkgname"
}
