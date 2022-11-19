# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=3.4
pkgrel=2
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'awk' 'curl' 'openssl' 'mpv' 'axel' 'ffmpeg')
optdepends=('vlc: An alternative video player' 'fzf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('45cfd2e43b8b83ae662fc3c8724b250281aca681828101e3bd5eb287a3794167')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
	install -Dm644 "./ani-cli.1.gz" "$pkgdir/usr/share/man/man1/ani-cli.1.gz"
}
