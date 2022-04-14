# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=21.10.6
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url='https://www.nextflow.io'
license=('Apache')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('104c0352c592924233ea7897cbfb2ece41795be348f97d6dfbc8d66e6271e4ad')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
