# Maintainer: Raymond Li <aur@raymond.li> 
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=110.0.5481.77
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for google-chrome-beta)"
arch=('x86_64')
url="https://chromedriver.chromium.org/"
license=('BSD')
depends=(alsa-lib gtk3 libcups libxss libxtst nss xdg-utils)
optdepends=(google-chrome-beta)
provides=(${_pkgname})
conflicts=(chromium)
source=("${_pkgname}_${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")
sha512sums=('61548113637edff263429e9a7d89a5e521f7f85d0cf181697fb6f7e399f53c1c04e61b9e9cd31ac1f19ce972403c097e310ecc1259e2f36af07de45ecb77095c')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}"
}
