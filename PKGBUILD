# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=4.7
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'aria2' 'ffmpeg' 'fzf')
optdepends=('vlc: An alternative video player')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2863952146ec15d3c755d40322dc93ecb670331f7a8004a659c5f82525f087ca')
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

