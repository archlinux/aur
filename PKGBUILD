# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=np1-mps
pkgver=0.20.02
pkgrel=2
pkgdesc="Terminal based jukebox with playlist management"
arch=('any')
url='https://github.com/np1/mps'
license=('GPL3')
depends=('python')
optdepends=('mpv: Alternative to mplayer for playback'
			'mplayer: Alternative to mpv for playback')
install=np1-mps.install
source=("https://github.com/np1/mps/archive/v$pkgver.tar.gz" 'np1-mps.install')
md5sums=('32f7939c7b082f5867b874308b377eb8'
         '26c08fc68ce960f1cc3a7f3f9157fa27')

package() {
	cd mps-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
