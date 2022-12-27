# Maintainer: Jorengarenar

pkgname=shelldel
_pkgname=shellDel
pkgver=0.5.4
pkgrel=1
pkgdesc='Freedesktop-compliant trashcan implemented in Shell script'
url='https://github.com/Jorengarenar/shellDel'
arch=('any')
license=('GPL2')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('535097f380c826aa8fc4719e267e20dad8b265bd90e39587ec623cba979d79ff')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm755 del "${pkgdir}/usr/bin/del"
}
