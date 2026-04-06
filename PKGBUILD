# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=4.11
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'aria2' 'ffmpeg' 'fzf')
optdepends=('vlc: An alternative video player')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96a0addc9021a029e7b0e421aa60136c004568d23e5e34ca189c395a979f2a29')
install="$pkgname.install"

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

