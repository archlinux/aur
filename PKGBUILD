# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="knock-bin"
_pkgname="knock"
pkgver=1.2.0
pkgrel=3
pkgdesc="Convert ACSM files to PDF/EPUBs with one command on Linux"
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPLv3')
source=("knock::$url/releases/download/$pkgver/$_pkgname-$pkgver-$arch-linux")
b2sums=('a80676def786b4e73a2e72130c5122f5539d66a8c668f1a73bbcf36212dd6406ab816fa58a541bfa3f874a98f727cf6d330e0d1db8224ab446f899252b1f123e')

package() {
	install -Dm755 ./knock "$pkgdir/usr/bin/knock"
}
