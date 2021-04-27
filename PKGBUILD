# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x32
pkgver=8.3
pkgrel=0
pkgdesc="BrowserStack Local Testing binary - 32bit"
arch=("i686" "x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x64")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-ia32.zip)
sha512sums=('4c97e124a1c46131031c41d12bb8f6b00231964b5929038e5ab5eb578ae05d8e99319843a97cc1116c889569e77907a2150d61b59ef58bd9f2b8b98885fef715')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
