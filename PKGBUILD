# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=26.04.6
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
arch=('any')
url='https://www.nextflow.io'
license=('Apache-2.0')
depends=('java-runtime>=17' 'java-runtime<=26' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('61a755edbed743cfbb568f3a6c67af68481a2f6a4d6dffcc4295e51318968281')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
