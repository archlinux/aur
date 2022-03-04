# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=1.9
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d01e5acc1961dfb2d1ea4219dcbc8a7b745a1066166216590592d2021aae7736')

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
