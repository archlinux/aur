# Maintainer: Andrey Balandin <it dot dervish AT gmail dot com>

pkgname=pkgsizes
pkgver=0.1.2
pkgrel=1
pkgdesc="Python script that prints a table with actual sizes of packages"
arch=('any')
url="https://github.com/AndreyBalandin/archlinux-pkgsizes/"
license=('GPL3')
depends=('python')
source=("${pkgname}-${pkgver}.py::https://raw.githubusercontent.com/AndreyBalandin/archlinux-pkgsizes/v${pkgver}/pkgsizes.py")
noextract=("pkgsizes.py")
sha512sums=('fc56b9b356e9246a5656aeff844b037f85d3dbbb47ee10f2756275e5f45dda76c6c75228710e197463960bd6f167658aaaded61c688aac3e14c6cc0af92914be')

package() {
    cd "${srcdir}"
    install -D "${pkgname}-${pkgver}.py" "${pkgdir}/usr/bin/pkgsizes.py"
}
