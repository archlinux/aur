# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.88
pkgrel=1
_pkgcom=3457
pkgdesc="A CCD capture software intended for the amateur astronomer."
arch=('x86_64')
url="https://www.ap-i.net/ccdciel"
license=('GPL-3.0-or-later')
depends=('libpasastro' 'qt5pas')
optdepends=('libraw: to open DSLR raw files')
conflicts=('ccdciel-git')
sha256sums=('965fe764bfc7f9a438f4f749f46a1b407313298938ef15dc3f4d164adc413167')
source=("ccdciel.tar.xz::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel-${pkgver}-${_pkgcom}-linux_x86_64.tar.xz")

package() {
    mkdir "${pkgdir}/usr/"
    tar -xf "${srcdir}/ccdciel.tar.xz" --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
