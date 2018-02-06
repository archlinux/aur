# Maintainer: Alex Peltzer <alexpe.aur@mailbox.org>

pkgname=nextflow
pkgver=0.27.4
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines."
arch=('any')
url="https://nextflow.io"
license=('GPL-3')
depends=('java-environment>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
md5sums=('adec1a7d94a0136a508900e2b43250ea')

package() {
	install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}

