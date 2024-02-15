# Maintainer: linduxed <linduxed at protonmail dot com>
# Contributor: Faerbit <faerbit at gmail dot com>
# Contributor: patrick96 <p dot ziegler96 at gmail dot com>

_pkgname=exercism
pkgname="${_pkgname}-bin"
pkgver=3.3.0
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
sha256sums_i686=('85376b1b36e09bb3ce09240205167fea5987f46b9fdca9581ec8ae642ef99fab')
source_x86_64=(${_rel_url}/exercism-${pkgver}-linux-x86_64.tar.gz)
sha256sums_x86_64=('4be098894c47fd1aa7886946cac31ec7df73bf9c1979ad1c9ec403a79074c1dd')

package(){
    cd "$srcdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D exercism "$pkgdir/usr/bin/exercism"
}
