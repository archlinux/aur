# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=paudit
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Simple Arch package audit script "
arch=(any)
url="https://github.com/Myl0g/paudit"
license=('GPL')
depends=('yaourt')
source=("https://github.com/Myl0g/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
	install -d "${pkgdir}/usr/bin"
	mv "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" "${pkgdir}/usr/bin/paudit"
	chmod 755 "${pkgdir}/usr/bin/paudit"
}
md5sums=('15ec9bd4dbe9312a2ec73a6dde884021')
