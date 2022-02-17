# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x64
pkgver=8.5
pkgrel=0
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip)
sha512sums=('396c7f1ac9e1f399cf1b4a961e2c17f724a64c23feee12191850501552f92f54acb1032fe6fa703aee6f982d351a506b7742cf04d276cfe9520d390d0337043a')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
