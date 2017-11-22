# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ceph-iscsi-config
pkgver=2.3
pkgrel=1
pkgdesc="Common configuration modules for managing iscsi gateways for ceph"
arch=('any')
url="https://github.com/ceph/ceph-iscsi-config"
license=('GPL3')
depends=('')
source=("$pkgname"::"git://github.com/ceph/ceph-iscsi-config.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname}/"
	python setup.py install --root="$pkgdir/" --optimize=1
}
