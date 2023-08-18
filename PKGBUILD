# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=117.0.5938.11
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for google-chrome-beta)"
arch=('x86_64')
url="https://chromedriver.chromium.org/"
license=('BSD')
depends=(alsa-lib gtk3 libcups libxss libxtst nss xdg-utils)
optdepends=(google-chrome-beta)
provides=(${_pkgname})
conflicts=(chromium)
source=("${_pkgname}_${pkgver}_linux64.zip::https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${pkgver}/linux64/${_pkgname}-linux64.zip")
sha512sums=('b1164d29d2eacc27971a13a465448568ff380b50f7567e1f2e7d83cdd7dc82706db19266c05b896270b69284aa1464de35ea4899424c16ff8c9f2eab9d42e0e0')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
