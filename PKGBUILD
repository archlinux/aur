pkgname=pacman-magic
pkgver=1
pkgrel=1
pkgdesc="Fix pacman cache and update PGP keys"
arch=('any')
depends=('pacman')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=('pacman-magic')
md5sums=('68ae6972b03695df01421fa415bebe38')

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 pacman-magic "${pkgdir}/usr/local/bin/pacman-magic"
}
