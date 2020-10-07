# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x32
pkgver=8.1
pkgrel=0
pkgdesc="BrowserStack Local Testing binary - 32bit"
arch=("i686" "x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x64")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-ia32.zip)
sha512sums=('46d0a26ce91b79347400d855b301e251f2aa9cdd07dd177b2cbb011fefa05b383b0fa7874b38ab68f3bacf1074b90900f4514d9e6acf64ca3ff7baad72908931')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
