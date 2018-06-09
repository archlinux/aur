# Maintainer: Josh VanderLinden <arch@cloudlery.com>

pkgname=pass-qr
pkgver=0.1.0
pkgrel=1
pkgdesc='A pass extension that lets you quickly generate a QR code for passwords using fzf or rofi'
arch=('any')
url='https://github.com/codekoala/pass-qr'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=(https://github.com/codekoala/pass-qr/archive/v${pkgver}.tar.gz)
sha512sums=('57c2cd51adb1adc829b5f209c816699b464f558d20a7b2e1ed8626d833d961318faf29702f18e8e3e700a7127695f64250e2a20552abbc67cff0309aa598eefc')

package() {
  cd "${srcdir}/pass-qr-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
