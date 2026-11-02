# Maintainer: ORION MELAENO <midway64@proton.me>
# Contributor: ORION MELAENO <midway64@proton.me>

pkgname=elfbsp-bin
_pkgname=elfbsp
pkgver=1.3.1
pkgrel=1
pkgdesc="Modern BSP tree builder for idTech1 games and source ports. Based on Andrew Apted's AJBSP."
arch=('x86_64')
url="https://elf-alchemist.github.io/elfbsp/"
license=('GPL-2.0-or-later')
depends=('libstdc++' 'glibc' 'libgcc')
makedepends=()
provides=('elfbsp')
conflicts=('elfbsp')
source=("https://github.com/elf-alchemist/elfbsp/releases/download/${_pkgname}_v${pkgver}/${_pkgname}_${pkgver}_linux_${arch}.zip")
sha256sums=('b35ed963805daa55ba71081a3364707812effa530ff5e8d739f07047586908d0')

package() {
    mkdir "${pkgdir}/usr/"
    mv "${srcdir}/${_pkgname}_${pkgver}_linux_${arch}"/* "${pkgdir}/usr/"
}
