# Maintainer: Flavius Aspra <flavius.as@gmail.com>

pkgname=chromedriver-https
provides=('chromedriver')
conflicts=('chromedriver')
pkgver=79.0.3945.36
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome)"
arch=('x86_64')
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=('Apache')
conflicts=('chromium')
depends=('libpng' 'gconf')
optdepends=('google-chrome')
md5sums=('77e6b631478c63c2df5809822a0af916')

source=("${pkgname}_${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/chromedriver_linux64.zip")

package() {
  mkdir -p "$pkgdir/usr/bin/"
  install -D -m 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/"
}
