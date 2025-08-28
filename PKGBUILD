# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=25.04.6
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
arch=('any')
url='https://www.nextflow.io'
license=('Apache-2.0')
depends=('java-runtime>=17' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('a94f8bd1db9c0271ad58ec40b9c71f812d081a66f782396928b9b1f740f0be5f')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
