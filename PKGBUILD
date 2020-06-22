# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x64
pkgver=8.0
pkgrel=3
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip)
sha512sums=('7608f148a4600e0d771d49dbd617aca95f81498613166f696f0503a3b191b80b1fc61d29b750e623b82c52aeb646aae4d1e1f8951d196f7e71bee8558613d4d1')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
