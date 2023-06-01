# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i686=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i686=('e47d26d4efe836043a2f4b436dbbd552962f23771bf7f741c85d57e77dc7af54')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('97ba90d7d83a9e8de57066be4d42319c33165a355c7072f535ba37c00aedf432')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
