# Maintainer: spider-mario <spidermario@free.fr>
pkgname=lens_calibrate
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc='Script to calculate lens calibration data for the lensfun project'
arch=('any')
url="https://gitlab.com/cryptomilk/lens_calibrate"
license=('GPL3')
depends=('python-exiv2>=0.2.1' 'python-numpy' 'python-scipy' 'python-pypdf2' 'darktable' 'hugin>=2018' 'imagemagick' 'gnuplot')
makedepends=('git')
source=("git+https://gitlab.com/cryptomilk/lens_calibrate.git#tag=$pkgname-$pkgver")
sha512sums=('SKIP')

package() {
	cd "$pkgname"
	install -Dm755 lens_calibrate.py "$pkgdir"/usr/bin/lens_calibrate
}
