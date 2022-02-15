# Maintainer: Mark Kostovetskyy <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=1.8
pkgrel=2
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'openssl' 'mpv')
optdepends=('vlc: An alternative video player'
'aria2: For downloading episodes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f49897f8e91bbbde7d6132d09c930af820c0256fdaa86574c19eda295f350196')

package() {
	cd "$srcdir/$pkgname-$pkgver"
        install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
}
