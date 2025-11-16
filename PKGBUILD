# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=jottr
pkgname=${_pkgname}-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Jottr is a cross-platform plain text editor focused on usability and speed"
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('bash' 'hicolor-icon-theme' 'python' 'python-requests' 'python-pyenchant' 'python-feedparser' 'python-pyqt5' 'python-pyqt5-webengine')

options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_all.deb")
sha512sums_x86_64=('6fed53f2389f5f013c49c8a98df09f59daecda630bad6466d637bfe1f1eeb4c291ae132279ad7565a959971797a7a3bbc98f677db680403e77e2fdb5a248e958')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"
}
