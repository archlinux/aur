# Maintainer: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=govendor
pkgver=1.0.8
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
sha256sums_x86_64=('90c587c3c2dffa242ed62c62426cd85bae8a74165d5434ccc0c31ee8e25d2588')
sha256sums_i686=('fac0189fabed4c19fae119bf961173310460a6b1070e86d38bfe7315b0a83c85')
sha256sums_armv6h=('d28b0f133b7d5d290b8203b7c3dc5ccfcd57762652f437ab5f62c0b50096cac3')
sha256sums_armv7h=('d28b0f133b7d5d290b8203b7c3dc5ccfcd57762652f437ab5f62c0b50096cac3')
sha256sums=('b73277f7730993ef8e7f80aed83e5309762fed4d77eced982abb2c00657c074d')

package() {
  install -m755 -D "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
