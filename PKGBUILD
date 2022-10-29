# Maintainer: Menci <huanghaorui301@gmail.com>

pkgname=obs-service-extract_file
pkgver=0.1
pkgrel=1
pkgdesc="Extract File Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-extract_file"
license=('GPL2')
groups=('obs')
depends=('tar' 'bzip2' 'gzip' 'xz' 'unzip')
revision='188ab1d0a46be40c43014825ca5a5fc8a77586e3'
source=("$pkgname-$pkgver.zip::https://github.com/openSUSE/obs-service-extract_file/archive/$revision.zip")
sha512sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$revision"
	mkdir -p "$pkgdir/usr/lib/obs/service/"
	cp extract_file extract_file.service "$pkgdir/usr/lib/obs/service/"
}
