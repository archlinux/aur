# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=1.6
pkgrel=2
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'jq' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
conflicts=('ani-cli-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v1.6.tar.gz")
sha256sums=('b53a8ebf7bf44bc7497ad4b4247e941ca9a7a89365717d3f4a2da349bcc80e45')

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
