# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

_name=textnote
pkgname=${_name}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple tool for creating and organizing daily notes on the command line'
arch=('x86_64')
url='https://github.com/dkaslovsky/textnote'
license=('MIT')
depends=()
conflicts=(${_name})
provides=(${_name})
source=(
    'https://github.com/dkaslovsky/textnote/releases/download/v1.0.0/textnote_linux_amd64'
)
sha256sums=(
    '69e25a2950c1a9d30e72d663681c0df28954a8b46cc81e6e52a168118b84eff9'
)

package() {
    cd "${srcdir}/"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "textnote_linux_amd64" "$pkgdir/usr/bin/textnote"
}
