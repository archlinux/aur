pkgname=denix-backgrounds
pkgver=1.0
pkgrel=2
pkgdesc="DeniX backgrounds"
arch=("any")
url="https://github.com/denix666/denix-backgrounds"
license=('GPL')
source=("git+https://github.com/denix666/denix-backgrounds.git")
md5sums=('SKIP')

package() {
	cd ${srcdir}/${pkgname}
	install -dm755 ${pkgdir}/usr/share/backgrounds/denix
	install -D -m644 usr/share/backgrounds/denix/* ${pkgdir}/usr/share/backgrounds/denix
}
