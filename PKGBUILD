# Maintainer: Guoyi ("malcology") <guoyizhang@malacology.net>
# Contributor: Guoyi ("malcology") <guoyizhang@malacology.net>

pkgname=modeltest-ng
pkgver=0.1.7
pkgrel=1
pkgdesc="A New and Scalable Tool for the Selection of DNA and Protein Evolutionary Models"
url='https://github.com/ddarriba/modeltest'
arch=('x86_64')
license=('GPL3')
source=("https://github.com/ddarriba/modeltest/files/6192913/modeltest-ng-${pkgver}-static.tar.gz")
sha256sums=('aab174ad96a420829ae02b0ed9802d008c7a67d5b48e4a7e7741d29b186a1097')

prepare() {
    cd "${srcdir}"
}

package() {
  install -dm755 "${pkgdir}"/usr/bin
  install -Dm755 "${srcdir}/modeltest-ng-static" "${pkgdir}/usr/bin/${pkgname}"
}
