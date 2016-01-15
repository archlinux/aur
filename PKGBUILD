# Maintainer: Simon Arjuna Erat (sea), erat.simon@gmail.com
# Contributor: Simon Arjuna Erat (sea), erat.simon@gmail.com

pkgname=vhs
pkgdesc="Video Handler Script (VHS) aka ffmpeg-tui"
license=('GPL3')
groups=()

arch=('any')
pkgver=2.7.6
pkgrel=0

url="https://github.com/sri-arjuna/vhs"
source=("https://github.com/sri-arjuna/vhs/archive/master.zip")
md5sums=('17563c056fb4176f72a03c5e17ce5db0')

provides=('vhs')
depends=( 'tui' 'ffmpeg' )

package() {
	cd "${srcdir}/${pkgname}-master"
	./configure --prefix=/usr --chroot="$pkgdir"
	./make-install
}
