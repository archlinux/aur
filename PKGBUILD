# Maintainer: selva.g@subcom.tech
# Maintainer: Selvaganapathy
# Contributor: Felix crueger
pkgname=trim_galore-git
pkgver=0.6.6
pkgrel=1
pkgdesc="Trim Galore is a wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data"
arch=(x86_64)
url="https://github.com/FelixKrueger/TrimGalore "
license=('GPL')
optdepends=('cutadapt')
source=("https://github.com/FelixKrueger/TrimGalore/archive/0.6.6.tar.gz")
md5sums=('1d35d9b803fbec0a3965bc4c220ff01e')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -r "TrimGalore-0.6.6/trim_galore" "${pkgdir}/usr/bin/trim_galore"
}
