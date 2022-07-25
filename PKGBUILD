# Maintainer: Mark <mark at sgtxd dot de >
pkgname='ani-cli'
pkgver=3.3
pkgrel=1
pkgdesc="A cli to browse and watch anime."
arch=('any')
url="https://github.com/pystardust/ani-cli"
license=('GPL3')
depends=('grep' 'sed' 'awk' 'curl' 'openssl' 'mpv' 'axel' 'ffmpeg')
optdepends=('vlc: An alternative video player' 'fzf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pystardust/ani-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fc37848a96bea1899c776433007aa4253e4e9bb9df1b447e6fca9f6864591d37')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "./ani-cli" "$pkgdir/usr/bin/ani-cli"
}
