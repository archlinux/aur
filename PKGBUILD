pkgname=iris-flower-wayland
pkgver=1.0
pkgrel=1
pkgdesc="Eye protection utility. Change brightness, color temperature and color scheme on Wayland"
arch=('i686' 'x86_64')
url="https://github.com/ueberchild/iris-flower-wayland"
license=('GPL3')
depends=('ddccontrol')
source=("git+https://github.com/ueberchild/iris-flower-wayland.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/$pkgname/"
	cc -Wall -std=c99 -o iris-flower-wayland iris-flower-wayland.c
}

package() {
    cd "${srcdir}/$pkgname/"
	install -D iris-flower-wayland "$pkgdir/usr/bin/iris-flower-wayland"
}
