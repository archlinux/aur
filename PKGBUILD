# Maintainer: Fabio Zanini <fabio _DOT zanini AT_ fastmail DOT_ fm>
pkgname=cellranger
pkgver=1.3.1
pkgrel=3
pkgdesc='Data analysis for 10X Genomics sequencing libraries.'
arch=('x86_64')
url="https://support.10xgenomics.com/single-cell/software/downloads/latest"
license=('custom')
depends=('bcl2fastq>=2.19')
makedeps=('gcc>=4.9')
source=("file://${pkgname}-${pkgver}.tar.gz")
md5sums=('524bb6a17ad10e242cd294678f4cf7d0')
options=('!emptydirs' '!strip')

package() {
  install -d "${pkgdir}"/usr/share
  install -d "${pkgdir}"/usr/bin

  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

}
