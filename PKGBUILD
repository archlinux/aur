# Maintainer:  Ali Kaafarani <ali@kvikshaug.no>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: mh00h <matt.halbert@gmail.com>

pkgname=nextflow
pkgver=21.04.1
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url='https://www.nextflow.io'
license=('Apache')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}::https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha256sums=('840ca394237e0f4d9f34642ff77c0ac92361319bcc9d9441f3d99f7b6d48ae7d')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/nextflow"
}
