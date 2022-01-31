# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=1.6
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'jq' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
conflicts=('ani-cli-git')
source=("https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli")
sha256sums=('e2e6ab7d9419d81b84b2300d3f9b45044d7e50b07e6378ce78a68a100deeaf52')

package() {
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
