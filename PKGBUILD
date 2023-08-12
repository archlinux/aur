# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=4.6
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'curl' 'mpv' 'aria2' 'ffmpeg' 'fzf')
optdepends=('vlc: An alternative video player')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cdb02cb5d02076a940fb4605caa180d117061c19701e37783059d44edaafd875')

package() {
	echo "Disclaimer: This project is to be used at the user's own risk, based on their government and laws."

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1" "$pkgdir/usr/share/man/man1/ani-cli.1"
}

