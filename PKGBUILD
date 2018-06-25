# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=paudit
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="Simple Arch package audit script "
arch=(any)
url="https://gitlab.com/Myl0g/paudit"
license=('GPL')
depends=('pacman')
source=("https://gitlab.com/Myl0g/paudit/uploads/bd6ba7c0b80ce387c57b61faee7e18c5/${pkgname}-v${pkgver}.tar.xz")

package() {
	install -d "${pkgdir}/usr/bin"
	mv "${srcdir}/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/paudit"
	chmod 755 "${pkgdir}/usr/bin/paudit"
}
md5sums=('d837c7bf3f461b5b16ee04e0dd0e0bc8')
