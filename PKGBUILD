# Maintainer: linsyking <xiangyiming2002@gmail.com>

pkgname=pdfannotator
pkgver=0.1.0
pkgrel=1
pkgdesc="A brief description of your package"
arch=('x86_64')
url="https://github.com/linsyking/pdfannotator"
license=('MIT')
depends=('webkit2gtk-4.1')
makedepends=('tar')
source=("https://github.com/linsyking/pdfannotator/releases/download/$pkgver/pdfreader_${pkgver}_amd64.deb")
sha256sums=('34c93ca727743b7461a504203216e235fa925c28c8a0b59f2ff4b2b10e3b526c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
