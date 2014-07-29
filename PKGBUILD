# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=np1-mps
pkgver=0.20.16
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
sha256sums=('23542f7dc7ae418ff41ea86debedfe5051d47efec3d0bc170ad0d59b5ec668d0')

package() {
	cd mps-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
