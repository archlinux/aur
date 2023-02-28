# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('x86_64')
url="https://gitlab.com/zehkira/monophony"
license=('MIT')
groups=()
depends=(
	'libadwaita'
	'python-gobject'
	'python-mpris_server'
	'python-ordered-set'
	'python-requests'
	'python-ytmusicapi'
	'yt-dlp'
)
makedepends=('nuitka')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('62cebe725642b9c0cfd54c231ead83476ef1efd052a9df6c64f4362c66e55fb2')

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
