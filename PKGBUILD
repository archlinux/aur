# Maintainer: JunYoung Gwak <aur@jgwak.com>

_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=81.0.4044.20
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-beta)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome-beta')
provides=(${_pkgname})
md5sums=('f20fd5725a84729263d67a035f0bb537')

source=("${_pkgname}_${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/"
}
