# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=1.5
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
sha256sums=('05e099aaab64b2343fc79c3f10acfb5c831679c4ed2956cf803e71f26dcd4f6c')

package() {
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
