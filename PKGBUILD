# Maintainer: JunYoung Gwak <i@jgwak.com>

_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=76.0.3809.12
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-beta)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome-beta')
provides=(${_pkgname})
md5sums=('91e0d276a462019afdabb91333643a5a')

source=("${_pkgname}_${pkgver}_linux64.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/"
}
