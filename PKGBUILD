# Maintainer: TheWeirdDev  <alireza6677 at gmail dot com>
pkgname=losange
pkgver=0.10.2
pkgrel=1
pkgdesc='A simple Stremio client for GNOME'
arch=('x86_64')
url='https://github.com/tymmesyde/Losange'
license=('GPL-3.0-only')
source=("https://github.com/tymmesyde/Losange/releases/download/v${pkgver}/losange_${pkgver}-1_amd64.deb")
b2sums=('8a0fedc4ea6700bed3b6bb944c5093612022b685a7a55b6b553993d11080b85693748f585b3ab0a109bbeb11616cd0e8c0f167fb6e812e743434a87d355be16e')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/bin/libexec" "${pkgdir}/usr/"
}
