# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>
# Contributor: esskayesss <ess at esskayesss dot dev>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.4.2
pkgrel=2
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i686=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i686=('91c857f3a55b1374c5d9c261b173d4a2413868eb56e82d3bd98b2ab93ec73c0e')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('b548793bf6296041e0bfcf7485d9f002660a518c67d642fe0fc9d97eb677e66c')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
