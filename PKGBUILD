# Maintainer: Raymo111 <aur@raymond.li>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin
pkgname=chromedriver
pkgver=98.0.4758.80
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for google-chrome)"
arch=('x86_64')
url="https://chromedriver.chromium.org/"
license=('BSD')
depends=(alsa-lib gtk3 libcups libxss libxtst nss xdg-utils)
optdepends=(google-chrome)
conflicts=(chromium)
source=("${pkgname}_${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_linux64.zip")
sha512sums=('9168bf22ce4a0e473084d9cd18c52538bb11af8a4622d6dbd3d339b94ff8cc41e62d2c25a93cd37d4048695a9e14d3ccd53e13b010f5434ada8fc7563ae2d12a')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
}
