# Maintainer: Christian Bundy <christianbundy@fraction.io>
# Contributor: Raphael Simon <simon.raphael@gmail.com>

pkgname=dollar-sign
pkgver=1.0.0
pkgrel=1
pkgdesc="$: command not found"
arch=('any')
url="https://github.com/fraction/dollar-sign"
license=('0BSD')
depends=('sh')
source=("https://github.com/fraction/dollar-sign/archive/v1.0.0.tar.gz")
md5sums=('546bb2bb88ea1cca02854431a54fac81')

package() {
	pwd
	install -d "${pkgdir}/usr/bin"
	cd "${pkgname}-${pkgver}/"
	install -Dm755 '$' "${pkgdir}/usr/bin/"
}
