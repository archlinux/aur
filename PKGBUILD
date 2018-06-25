# Maintainer: Andrey Balandin <it dot dervish AT gmail dot com>

pkgname=pkgsizes
pkgver=0.1.1
pkgrel=1
pkgdesc="Python script that prints a table with actual sizes of packages"
arch=('any')
url="https://github.com/AndreyBalandin/archlinux-pkgsizes/"
license=('GPL3')
depends=('python')
source=("pkgsizes-${pkgver}.py::https://raw.githubusercontent.com/AndreyBalandin/archlinux-pkgsizes/v${pkgver}/pkgsizes.py")
md5sums=('SKIP')

package() {
    install -D pkgsizes-${pkgver}.py "${pkgdir}/usr/bin/pkgsizes.py"
}
