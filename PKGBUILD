# Maintainer: <Zayac ZayacTheEngineer@protonmail.com>

pkgname=lazywal-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Animated wallpaper manager written in shell script"
arch=('any')
url="https://github.com/Zayac-The-Engineer/${pkgname}"
license=('MIT')
depends=(mpv xwinwrap-git)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zayac-The-Engineer/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
