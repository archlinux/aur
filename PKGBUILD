# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=ucm
pkgver=0.1.1
pkgrel=1
pkgdesc="Cocos2D-X update utility for non-Linux makefiles that only uses an updated CMakeLists.txt to update the other project files."
arch=('any')
url='https://github.com/Rubonnek/ucm'
license=('GPL3')
provides=('ucm')
replaces=('ucm')
#conflicts=('ucm')
source=("https://github.com/Rubonnek/${pkgname}/archive/v${pkgver}.tar.gz")

sha256sums=('80605c4ff1c4dc70d013e9539ccd5d1eda2058e25cd85df9a6340bebe7f74f0b')

package() {
	mkdir -p "$pkgdir/usr/bin"
	mv "$srcdir/$pkgname-$pkgver"/parse_cocos_cmake.pl "$pkgdir/usr/bin"
	mv "$srcdir/$pkgname-$pkgver"/modify_xcode_project.rb "$pkgdir/usr/bin"
	mv "$srcdir/$pkgname-$pkgver"/ucm "$pkgdir/usr/bin"
}
