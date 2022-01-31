# Maintainer: Ingo Fabbri <der_ulmen@yahoo.de>

pkgname=browserstack-local-x64
pkgver=8.4
pkgrel=0
pkgdesc="BrowserStack Local Testing binary - 64bit"
arch=("x86_64")
license=('commercial')
url="https://www.browserstack.com/local-testing/"
conflicts=("browserstack-local-x32")
depends=("gcc-libs")
source=(https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip)
sha512sums=('3e82eac8846c562139887533846457acd1e9529d0759675e9c55ba1e26d38980f7231cd7cc6dd2e84cf913fb39af34e428db7efba399d7c21a59a3daa06e4bba')

package() {
  install -Dm755 BrowserStackLocal "$pkgdir/usr/bin/BrowserStackLocal"
}
