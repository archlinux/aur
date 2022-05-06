# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=2.2
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv' 'ffmpeg' 'awk')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('973d335a75bd7f920c244000ad6b057f702fb37752e7bea1b5bcf038785ec925')

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
