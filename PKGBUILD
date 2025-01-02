# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.88
pkgrel=2
_pkgcom=3457
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.ap-i.net/ccdciel"
license=('GPL-3.0-or-later')
depends=('libpasastro' 'qt5pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
source=()
sha256sums=()
source_x86_64=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_amd64.deb")
sha256sums_x86_64=('62f67b03fe243382f054a124e0957be13e1728f31f131298cfd52339ca1905ba')
source_aarch64=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('98fe6bf16cfeca05060ad1d4e701e14467d0608d0da443c478d24da047bc450f')
source_armv7h=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('e834adcacd9500d4e6cdae0e57b676914b36809ae088c99c3d64c3ac992d9680')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
