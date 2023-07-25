# Maintainer: Calvin Ross <calvinjayross@gmail.com>

pkgname=browserstack-local-x64
pkgver=8.9
pkgrel=0
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
depends=("gcc-libs")
source=(https://bstack-local-prod.s3.amazonaws.com/binaries/release/v8.9/BrowserStackLocal-linux-x64.zip)
sha512sums=('92592a28db2fca16beb8335d27bbb07b6c581de997b4737bb828f634264353597db2321367adbfd96b745bd1a4bf45471a3986ff41dee1166e6574a2cb174dac')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
