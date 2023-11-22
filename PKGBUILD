# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=120.0.6099.35
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
sha512sums=('1b8c38475b7360c476ae2f044700d4c84965721b8a8bac2079e1e672631ca2f5ac0c8e939f09ef34d5978f745443137557ca29054c80d63c50d9c358115fe044')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
