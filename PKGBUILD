# Maintainer: Raymond Li <aur@raymond.li> 
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=100.0.4896.60
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
sha512sums=('32674808bf20a5b64fcaae3cd10af0089c6d3c3b4c236ba1c6090cf3dbff0791981c9edb14b5c506f884769daf83b7d24abeec33c283501bd67ba7a6fc63d381')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}"
}
