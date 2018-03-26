# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: James An <james@jamesan.ca>
# Contributor: lybin

pkgname=chromedriver
pkgver=2.37
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol"
arch=('i686' 'x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome')
md5sums=('f4fbbf50eaec2b9c9e21536e39b9999e')

source=("${pkgname}_${pkgver}_linux64.zip::http://chromedriver.storage.googleapis.com/${pkgver}/${pkgname}_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
