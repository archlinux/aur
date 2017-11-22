# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ceph-iscsi-cli
pkgver=2.5
pkgrel=1
pkgdesc="Configshell based cli for managing ceph/iscsi gateways built using LIO"
arch=('any')
url="https://github.com/ceph/ceph-iscsi-cli"
license=('GPL3')
depends=('')
source=("$pkgname"::"git://github.com/ceph/ceph-iscsi-cli.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname}/"
	python setup.py install --root="$pkgdir/" --optimize=1
}
