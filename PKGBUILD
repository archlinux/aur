# Maintainer: Alex Peltzer <alexpe.aur@mailbox.org>

pkgname=nextflow
pkgver=0.27.5
pkgrel=1
pkgdesc="A DSL for data-driven computational pipelines."
arch=('any')
url="https://nextflow.io"
license=('GPL-3')
depends=('java-environment>=8')
source=("https://github.com/nextflow-io/nextflow/releases/download/v${pkgver}/nextflow")
md5sums=('45e7b38e85cd8a2318a9ca71cd99c304')

package() {
	install -D -m755 "${srcdir}/nextflow" "${pkgdir}/usr/bin/nextflow"
}

