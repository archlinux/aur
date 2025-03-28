# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ttytm
_pkgname=wthrr
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Weather companion for the terminal"
arch=('x86_64')
url="https://github.com/ttytm/wthrr-the-weathercrab"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("https://github.com/ttytm/wthrr-the-weathercrab/releases/download/v${pkgver}/wthrr-linux-x86_64.deb")
sha256sums_x86_64=('2740cb8d7375e37a12564528039380050280d8b8af6b29ea97a6a89333a9d42e')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}

