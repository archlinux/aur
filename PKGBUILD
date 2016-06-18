# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=govendor
pkgver=1.0.3
pkgrel=1
pkgdesc='Go vendor tool that works with the standard vendor file.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/kardianos/govendor'
license=('custom:BSD')
depends=('glibc')
source_x86_64=("${pkgname}::https://github.com/kardianos/govendor/releases/download/v${pkgver}/${pkgname}_linux_amd64")
source_i686=("${pkgname}::https://github.com/kardianos/govendor/releases/download/v${pkgver}/${pkgname}_linux_386")
source_armv6h=("${pkgname}::https://github.com/kardianos/govendor/releases/download/v${pkgver}/${pkgname}_linux_arm")
source_armv7h=("${pkgname}::https://github.com/kardianos/govendor/releases/download/v${pkgver}/${pkgname}_linux_arm")
source=("https://raw.githubusercontent.com/kardianos/${pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('2a7b317dc5ccf85d4fbda30efa4be5c8453d5a4c788901f516094427db583702')
sha256sums_i686=('fd08acf6c13d07c44afa31a71820d3e9c264f8783eb57bc8ec4291cad74d5206')
sha256sums_armv6h=('da89205ea5736cb647b46fa4a144a78f39ea4852b82b69db3208c72888b8d2c2')
sha256sums_armv7h=('da89205ea5736cb647b46fa4a144a78f39ea4852b82b69db3208c72888b8d2c2')
sha256sums=('b73277f7730993ef8e7f80aed83e5309762fed4d77eced982abb2c00657c074d')

package() {
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
