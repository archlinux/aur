# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=unity-like-plank-theme
pkgver=0.1.2
pkgrel=1
pkgdesc="A plank dock theme that doesn't look like Unity but gives you a similar interface"
arch=('any')
url="https://github.com/Kycko/unity-like-plank-theme"
license=('GPL')
depends=('plank')
source=(https://github.com/Kycko/unity-like-plank-theme/archive/${pkgver}.tar.gz)
sha1sums=('180b86118bdbf2729cb17da4663e7d0f5759f3a3')

build() {
	true
}

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/share/plank/themes
	cp -r Unity-like $pkgdir/usr/share/plank/themes
}
