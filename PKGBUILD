# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=unity-like-plank-theme
pkgver=0.1
pkgrel=1
pkgdesc="A plank dock theme that doesn't look like Unity but gives you a similar interface"
arch=('any')
url="https://github.com/Kycko/unity-like-plank-theme"
license=('GPL')
depends=('plank')
source=(https://github.com/Kycko/unity-like-plank-theme/archive/${pkgver}.tar.gz)
sha1sums=('57e6158b2bef869941e55abca326c8c9f6e9cbf4')

build() {
	true
}

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/plank/themes
	cp -r Unity-like $pkgdir/usr/share/plank/themes
}
