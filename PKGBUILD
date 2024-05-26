# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=sortty
pkgver=1.9
pkgrel=2
pkgdesc="Sorting algorithms in the terminal"
arch=('any')
url="https://github.com/dormant-chicken/sortty"
license=('GPL-2.0-or-later')
depends=('ncurses' 'python' 'python-art')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dormant-chicken/sortty/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c421a4a95987826b268b47f12d380f153b88eada30cbaf8a186bfa773dd46873')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"
    install -D -m755 sortty.py "${pkgdir}/usr/bin/${pkgname}"
}
