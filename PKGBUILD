# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcfanno
pkgver=0.2.8
pkgrel=1
pkgdesc="Annotate a VCF with other VCFs/BEDs/tabixed files"
arch=('x86_64')
url="https://github.com/brentp/vcfanno"
license=('MIT')
depends=('')
provides=('vcfanno')
conflicts=('vcfanno')
source=("https://github.com/brentp/vcfanno/releases/download/v${pkgver}/vcfanno_linux64")
md5sums=('e5c665b0ffee8cb09a732768cdaae733')

package() {
    mkdir -p "${pkgdir}"/usr/bin
    install -D -m775 "${srcdir}"/vcfanno_linux64 "${pkgdir}"/usr/bin/vcfanno
}
