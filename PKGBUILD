# Maintainer: Josh VanderLinden <arch@cloudlery.com>

pkgname=pass-qr
pkgver=0.2.0
pkgrel=1
pkgdesc='A pass extension that lets you quickly generate a QR code for passwords using fzf or rofi'
arch=('any')
url='https://github.com/codekoala/pass-qr'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=(https://github.com/codekoala/pass-qr/archive/v${pkgver}.tar.gz)
sha512sums=('253b7df1c86103fa482cdccacd010d2758f07b8b63cc2f0185154fc7c86922c47a87e493a3b61352c4285c36fd97b20bbbd157d7184210985b9023eae2756c3b')

package() {
  cd "${srcdir}/pass-qr-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
