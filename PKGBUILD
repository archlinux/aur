# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x32
pkgver=8.0
pkgrel=1
pkgdesc="BrowserStack Local Testing binary - 32bit"
arch=("i686" "x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x64")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-ia32.zip)
sha512sums=('c9f79b688ca6aab9575edb3353e0cd9d3c3087b200f74a29eca1756d5f0f0b57080815692caf878b52c687fc7134e04f0a9ceededb7a5a650aba4f4addf803e5')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/bin/BrowserStackLocal"
}
