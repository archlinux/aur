pkgname=pacman-magic
pkgver=1
pkgrel=1
pkgdesc="Fix pacman cache and update PGP keys"
arch=('any')
depends=('pacman')
url="http://wiki.victor3d.com.br"
license=('GPL')
source=('pacman-magic')
md5sums=('d568fb08baccb1b95348a68a4a4e6a15')

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 pacman-magic "${pkgdir}/usr/local/bin/pacman-magic"
}
