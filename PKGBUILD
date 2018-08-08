# Maintainer: Alex Peltzer <alexpe.aur@mailbox.org>

pkgname=nextflow
pkgver=0.31.1
pkgrel=0
pkgdesc="A DSL for data-driven computational pipelines."
arch=('any')
url="https://nextflow.io"
license=('GPL-3')
depends=('java-environment>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
md5sums=('f6e7d29933d3031c2096af2792dc01a4')

package() {
	install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}

