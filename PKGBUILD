# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='textadept-textredux'
pkgver='1.0.3'
pkgrel=1
pkgdesc='Module for Textadept that offers text-based interfaces for core functionality'
arch=('any')
url='https://rgieseke.github.io/textredux/'
license=('MIT')
depends=('textadept')
source=("https://github.com/rgieseke/textredux/archive/v${pkgver}.tar.gz")
sha256sums=('bd5f90fd641495f3db5b090ffadef0bd74f46813c9e1921dc4473522be2dc9ff')

package() {
	mkdir -p "${pkgdir}/opt/textadept/modules/textredux"
	cp -r "${srcdir}/textredux-${pkgver}/." "${pkgdir}/opt/textadept/modules/textredux/"
}
