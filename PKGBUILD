# Maintainer: Dominik Stanisław Suchora <hexderm@gmail.com>

pkgname='torge'
pkgver=1
pkgrel=1
pkgdesc='A shell script for searching for links on torrent sites'
arch=('any')
url='https://github.com/TUVIMEN/torge'
license=('GPL-3.0-or-later')
depends=('curl' 'reliq')
optdepends=('jq: json support' 'xclip: clipboard support' 'xsel: clipboard support')
provides=('torge')
source=('git+https://github.com/TUVIMEN/torge')
sha256sums=('SKIP')
makedepends=('git')

package(){
    cd "${pkgname}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
