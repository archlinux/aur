# Maintainer FadeMind <fademind@gmail.com>
# Contributor: IgnorantGuru <ignorantguru@users.sourceforge.net>

pkgname=rmdupe
pkgver=1.0.4
pkgrel=1
pkgdesc="Removes duplicate files; supports trash, simulate, size, custom rm command"
arch=('any')
depends=("bash")
license=('GPL3')
url="https://github.com/IgnorantGuru/${pkgname}"
changelog="ChangeLog"
source=("${pkgname}-${pkgver}.tar.xz::https://raw.githubusercontent.com/IgnorantGuru/${pkgname}/master/packages/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('548730c5530eb1036dea985846924307d9758564985477078cec468bf3fda05f')

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "ChangeLog"  "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
    install -D -m644 "COPYING"    "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
    install -D -m644 "README"     "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -D -m644 "COPYING"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

