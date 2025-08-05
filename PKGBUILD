# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.91
pkgrel=1
_pkgcom=3734
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
sha256sums_x86_64=('fea2389d69074da024f7ed23cd2c1d7e6b59d368aed831d8c0d6faed598d58cf')
source_aarch64=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('c71210192b2be89884bda53a988119a781cd001d1f65ee1a803244fcdffdaa7d')
source_armv7h=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('a44e3d73c1d464a4de98701f379828e1db5bb2e91626444455cb4e9a75b4e0a8')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
