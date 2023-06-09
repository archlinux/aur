# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malias
pkgver=1.2.2
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e837c7013513ec2d249e436afd01e2d66be2b09e211fc5a71fd2c9b9d9fc80f1')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
