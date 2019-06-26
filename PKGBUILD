# Maintainer: mh00h <matt.halbert@gmail.com>
pkgname=nextflow
pkgver=19.04.1
pkgrel=0
pkgdesc="A DSL for data-driven computational pipelines"
arch=('any')
url="https://www.nextflow.io"
license=('Apache')
depends=('java-runtime>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
md5sums=('a5ff593271290274e1baaff3f1e980fe')

package() {
    NXF_HOME="${HOME}/.local/share/nextflow"
    install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}
