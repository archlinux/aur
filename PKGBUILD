# Maintainer: Absobel <imkonnu@gmail.com>
pkgname=otf-made-evolve-sans
pkgver=0.1
pkgrel=1
pkgdesc="MADE Evolve is modern futuristic sans serif fontfamily. This combination of futuristic and geometric to create a modern design."
arch=("any")
url="https://www.dafont.com/made-evolve-sans.font"
license=("LicenseRef-Custom")
source=("https://dl.dafont.com/dl/?f=made_evolve_sans")

sha256sums=('3b85263b40051badff6b6bc44ed6507d9bb26b908e5774a4b6e971514d7cce5d')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/OTF/"
    install -m644 ./*.otf "${pkgdir}/usr/share/fonts/OTF/"

    install -D -m644 "License READ ME FIRST.txt" ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
