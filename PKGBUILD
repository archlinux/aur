# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=26.04.4
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
arch=('any')
url='https://www.nextflow.io'
license=('Apache-2.0')
depends=('java-runtime>=17' 'java-runtime<=26' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('416fc4561ef7c6eca8c3f5ee87ff358bed0095503056a7e97ed899d85a1817ed')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
