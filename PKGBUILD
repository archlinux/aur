# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x64
pkgver=8.1
pkgrel=1
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip)
sha512sums=('a0167df92d2e5f1636144dd22da6c8b95ebfe088e19b801b3b1f4544a5ea66b48c98eeccb72dc0a27af1952ceee40d6adc11be967fd4a4a0e052159fa6f54609')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
