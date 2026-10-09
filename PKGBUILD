# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.97
pkgrel=1
_pkgcom=4213
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.ap-i.net/ccdciel"
license=('GPL-3.0-or-later')
depends=('libpasastro' 'qt5pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
source=()
sha256sums=()
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_amd64.deb")
sha256sums_x86_64=('5329133e694d9dcbeafa3ca720021d8209be7f138f780b36f43bdc83fa20ad74')
source_aarch64=("${pkgname}-${pkgver}_arm64.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('90585962660cc5e496601821ee0d32a5319eb3230d927492dbe5ff270c48aa57')
source_armv7h=("${pkgname}-${pkgver}_armhf.deb::https://sourceforge.net/projects/ccdciel/files/${pkgname}_${pkgver}/${pkgname}_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('a6f5b567770e27c32617efc8465e9cd1a9e2e00e8d03199a88c2904cf9334965')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
