pkgname=pacman-magic
pkgver=1
pkgrel=1
pkgdesc="Fix pacman cache and update PGP keys"
arch=('any')
depends=('pacman' 'sudo')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=('pacman-magic')
md5sums=('1302ebb68fcaccb5ad4423d9841183b8')

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 pacman-magic "${pkgdir}/usr/bin/pacman-magic"
}
