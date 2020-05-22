# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=20.04.1
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url='https://www.nextflow.io'
license=('Apache')
depends=('java-runtime>=8')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('b46833ad75b9b7db72668235b53d5c295a9ab02b50d36506bbbe53f383239bde')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}