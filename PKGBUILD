pkgname=pacman-magic
pkgver=1
pkgrel=1
pkgdesc="Fix pacman cache and update PGP keys"
arch=('any')
depends=('pacman' 'sudo')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=('pacman-magic')
md5sums=('095830b4f42ad48322f247ce5323778c')

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 pacman-magic "${pkgdir}/usr/local/bin/pacman-magic"
}
