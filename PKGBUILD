# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>
# Contributor: esskayesss <ess at esskayesss dot dev>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.5.0
pkgrel=1
pkgdesc="Command line client for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
# URL for release downloads
_rel_url="${url}/releases/download/v${pkgver}"
conflicts=(exercism)
replaces=("exercism-cli")
license=("MIT")

source_i386=(${_rel_url}/exercism-${pkgver}-linux-i386.tar.gz)
sha256sums_i386=('4b56aaba8f3d4b7aadf29f8796b260d5a9a79ea0c871783a4f1e566b067cd015')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('002520b300f7faa7f2bfe80d8f111e6484a303e640d71f5ada60d1a645432db8')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
