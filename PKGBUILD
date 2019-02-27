# Maintainer: JunYoung Gwak <i@jgwak.com>

_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=73.0.3683.20
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-beta)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome-beta')
md5sums=('0bb4f8f1fdacac21a6cd9cc2fc5b75d8')

source=("${_pkgname}_${pkgver}_linux64.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/"
}
