# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=keepass-plugin-qrcodegenerator
pkgver=2.0.12
pkgrel=1
pkgdesc="This plugin can display passwords as QR codes."
arch=(any)
url='https://keepass.info/plugins.html#qrcodegen'
license=('CPOL')
depends=('keepass')
source=("https://keepass.info/extensions/v2/qrcodegen/QrCodeGenerator-${pkgver}.zip")
sha256sums=('72f8fc4c85f0db438549b7b830e133b27857c60aecd53eca8476937bfb4bfc51')

package() {
  install -Dm644 "$srcdir/QrCodeGenerator.plgx" "${pkgdir}/usr/share/keepass/plugins/QrCodeGenerator.plgx"
}
