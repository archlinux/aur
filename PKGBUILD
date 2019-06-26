# Maintainer: mh00h <matt.halbert@gmail.com>
pkgname=nextflow
pkgver=19.04.1
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url="https://www.nextflow.io"
license=('Apache')
depends=('java-runtime>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
md5sums=('a5ff593271290274e1baaff3f1e980fe')

package() {
    install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}
