# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=tcmu-runner
pkgver=v1.2.0
pkgrel=1
pkgdesc="A daemon that handles the userspace side of the LIO TCM-User backstore."
arch=('any')
url="https://github.com/open-iscsi/tcmu-runner"
license=('GPL3')
depends=()
makedepends=('git' 'cmake' 'gcc')
source=("$pkgname"::"git://github.com/open-iscsi/tcmu-runner.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
	cd ${pkgname}
	cmake ./
	make
}

package() {
	cd "${pkgname}"
	
}
