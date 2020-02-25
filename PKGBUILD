# Maintainer: mh00h <matt.halbert@gmail.com>
pkgname=nextflow
pkgver=20.01.0
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines"
install=nextflow.install
arch=('any')
url="https://www.nextflow.io"
license=('Apache')
depends=('java-runtime>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
sha512sums=('092ec1ef952f5d5d938e591cbcf30dc2e5bc391b13679153d2fdb897a78a53ffa6e37971a4e9b1e103efeef69076eb3dacd16949934bc882f029307f59d97c1d')

package() {
    install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}
