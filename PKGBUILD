# Maintainer: TheWeirdDev  <alireza6677 at gmail dot com>
pkgname=losange
pkgver=0.10.1
pkgrel=1
pkgdesc='A simple Stremio client for GNOME'
arch=('x86_64')
url='https://github.com/tymmesyde/Losange'
license=('GPL-3.0-only')
source=("https://github.com/tymmesyde/Losange/releases/download/v${pkgver}/losange_${pkgver}-1_amd64.deb")
b2sums=('1abd01f3c7da3a523aac86da02ef3aa021c55c3948a34eb310897faf1f1b6c359eda41ee0e5d0edf116d599a4c98d1b13ab208ec991489f417363ec78b20a4fd')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/bin/libexec" "${pkgdir}/usr/"
}
