# Maintainer: Amos (LFlare) Ng <me@amosng.com>

pkgname=paping-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Cross-platform TCP port testing, emulating the functionality of ping (port ping)"
arch=('x86_64')
url="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/paping"
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::${url}/paping_${pkgver}_${arch}_linux.tar.gz)
b2sums=('75ab976318ceb69ab5c28d5861d7e21b994585ac90e11d9378789450aeed0e493d1a978bea42d131509125b437ba3f2123d4cd2530ee13a0ec1b867a791a4bfb')

package() {
    install -Dm755 ./paping -t "${pkgdir}/usr/bin/paping"
}
