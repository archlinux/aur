# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

_name=textnote
pkgname=${_name}-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
conflicts=(${_name})
provides=(${_name})
source=("https://github.com/dkaslovsky/textnote/releases/download/v${pkgver}/textnote_linux_amd64")
sha256sums=('02cc79d2224344174cf3688ad6f57106bd78403b2fe26b2d3d609bb11cc92bf6')

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote_linux_amd64" "$pkgdir/usr/bin/textnote"
}
