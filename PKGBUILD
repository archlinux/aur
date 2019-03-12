# Maintainer: JunYoung Gwak <i@jgwak.com>

_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=74.0.3729.6
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-beta)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome-beta')
provides=(${_pkgname})
md5sums=('3cd9e67808926bfba9a3f5946e2a994d')

source=("${_pkgname}_${pkgver}_linux64.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/"
}
