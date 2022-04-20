# Maintainer: Jorengarenar

pkgname=shelldel
_pkgname=shellDel
pkgver=0.5.3
pkgrel=1
pkgdesc='Simple script, which provides more convenient backup options for QuiteRSS'
url='https://github.com/Jorengarenar/shellDel'
arch=('any')
license=('GPL2')
source=("${_pkgname}::https://github.com/Jorengarenar/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('97d106a0e4c55a0d1a37072252a1e7928dbd3bb14cae40208e8af7cab09c10b7')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm755 del "${pkgdir}/usr/bin/del"
}
