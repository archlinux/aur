# Maintainer: Majid Butler <majidbutler@akuma-dev.com>
pkgname=creep2
pkgver=1.2
pkgrel=1
pkgdesc="A pretty sweet version of the creep pixel font for terminals without negative spacing support."
arch=('any')
url="https://github.com/akuma-dev/creep2"
license=('MIT')
source=("git+https://github.com/akuma-dev/creep2.git")
makedepends=('git')
md5sums=('SKIP')

package() {
	cd "$srcdir/creep2"
    install -D -m644 creep2.ttf "$pkgdir/usr/share/fonts/misc/creep2.ttf"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
