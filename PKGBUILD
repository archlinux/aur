pkgname=fortune-mod-oblique-strategies
_pkgname=fortunes-oblique-strategies
pkgver=201610103
pkgrel=1
pkgdesc="Collection of fortune files for Brian Eno's 'Oblique Strategies'"
url="https://github.com/hermzz/fortunes-oblique-strategies"
arch=(any)
license=(unknown)
depends=(fortune-mod)
makedepends=(git)
source=('git+https://github.com/hermzz/fortunes-oblique-strategies.git')
md5sums=(SKIP)

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p ${pkgdir}/usr/share/fortune

    install -D -m644 oblique-ed4 ${pkgdir}/usr/share/fortune/oblique-strategies
    install -D -m644 oblique-ed4.dat ${pkgdir}/usr/share/fortune/oblique-strategies.dat
}
