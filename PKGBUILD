# Maintainer: JunYoung Gwak <aur@jgwak.com>

_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=85.0.4183.38
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-beta)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('alsa-lib' 'gtk3' 'libcups' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('google-chrome-beta')
provides=(${_pkgname})
md5sums=('856c69ea0e6c71b04119167e1b72e4bf')

source=("${_pkgname}_${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/"
}
