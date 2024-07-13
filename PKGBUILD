# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=24.04.3
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url='https://www.nextflow.io'
license=('Apache')
depends=('java-runtime>=11' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('e258f6395a38f044eb734cba6790af98b561aa521f63e2701fe95c050986e11c')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
