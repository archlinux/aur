# Maintainer: nycko123 <nycko123 at gmail com>
# Previous Maintainer: Youngbin Han <sukso96100 at gmail com>
# Previous Contributor: blainester <theblainestory at gmail com>
pkgname=micro-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=('xclip: Required for copying/pasting text')
conflicts=("micro-git micro micro-nightly-bin")
provides=("micro")

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('f4b31deca253c933e1ee9fa462472b302d16c9d88ad4460b7a22bc25967e6ca3')
sha256sums_i686=('aa989d2c75d78e2d3aa1fa2498b10e5428d0e3fc8465780e8598bc2b91803d02')

package(){
 install -Dm755 "${srcdir}/micro-${pkgver}/micro" "${pkgdir}/usr/bin/micro"
 install -Dm644 "${srcdir}/micro-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

