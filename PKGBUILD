# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

_name=textnote
pkgname=${_name}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
conflicts=(${_name})
provides=(${_name})
source=('https://github.com/dkaslovsky/textnote/releases/download/v${pkgver}/textnote_linux_amd64')
sha256sums=('4bfd8bce0b1786a0d48fbb3dbb69e425e798f4531a4d449357108474e26cdd34')

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote_linux_amd64" "$pkgdir/usr/bin/textnote"
}
