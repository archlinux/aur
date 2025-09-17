# Contributor: rapiertg <rapiertg@gmail.com>

pkgname=ccdciel
pkgver=0.9.92
pkgrel=1
_pkgcom=3775
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
sha256sums_x86_64=('7cd9a8a5618c020d65094a9ae891a595e82792a9a079ca4d08b26d744cdc4843')
source_aarch64=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_arm64.deb")
sha256sums_aarch64=('766aea10039c3af125c1b21fa59280a49a09eebb64ed7cc77029cb84d3a1a5e4')
source_armv7h=("${pkgname}-${pkgver}_${CARCH}.deb::https://sourceforge.net/projects/ccdciel/files/ccdciel_${pkgver}/ccdciel_${pkgver}-${_pkgcom}_armhf.deb")
sha256sums_armv7h=('be72fbcb768eabbe1584e4da24e12b49926201305723a3969348790ffee09a3b')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
    chmod 755 "${pkgdir}/usr"
    chown -R root:root "${pkgdir}/usr"
}
