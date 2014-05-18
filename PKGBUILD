# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=np1-mps
pkgver=0.20.14
pkgrel=1
pkgdesc="Terminal based jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps'
license=('GPL3')
depends=('python')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
install=np1-mps.install
source=("https://github.com/np1/mps/archive/v$pkgver.tar.gz")
sha256sums=('0a78a01a923ab230ffc4d09ee302cbaae6cb4c68cb0d924137e58de8224bcdf3')

package() {
	cd mps-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
