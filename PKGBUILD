# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=2.0
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv' 'ffmpeg')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb27aaa2c2c66a1198e4876e40c0366693e05d91ea66beaaa739b910ff7040b0')

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
