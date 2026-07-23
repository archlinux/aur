# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=4.15
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'aria2' 'ffmpeg' 'fzf' 'botan')
optdepends=('vlc: An alternative video player' 'ani-skip: For skipping anime intros')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ede3794978dc2eec87475e0ea96449a604a2589e940c1eab6bfbddb8529f973')
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

