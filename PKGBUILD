# Maintainer: Raymond Li <aur@raymond.li> 
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=99.0.4844.51
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
sha512sums=('15ac3dcbaf6bf4d5d610444b24ca680e23b84d11be978b6ba7889ce9ae2c343a15ac54707a03a81551186edb7f44c161f1dfb23fc586e7445044e8c96ee2537c')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}"
}
