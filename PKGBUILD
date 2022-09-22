# Maintainer: selva.g@subcom.tech
# Maintainer: Selvaganapathy
# Contributor: Felix crueger
pkgname=trim_galore
pkgver=0.6.7
license=("GPL-3.0")
pkgrel=1
pkgdesc="Trim Galore is a wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data"
arch=(x86_64)
url="https://github.com/FelixKrueger/TrimGalore "
optdepends=('cutadapt')
source=('https://github.com/FelixKrueger/TrimGalore/archive/refs/tags/0.6.7.tar.gz')
md5sums=('SKIP')

package() {
    mkdir $pkgdir/opt/
    cp -r TrimGalore-0.6.7/trim_galore $pkgdir/opt/trim_galore
    
    mkdir -p "${pkgdir}/usr/bin"
    chmod 755 $pkgdir/opt/trim_galore
    cp  "$pkgdir/opt/trim_galore" "${pkgdir}/usr/bin/trim_galore"

}
