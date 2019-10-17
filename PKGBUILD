# Maintainer: peace885 <reyadmin@gmail.com>
# Contributor: SuperBo<supernbo@gmail.com>
pkgname=cloud-utils
pkgver=0.31
pkgrel=1
pkgdesc="A useful set of utilities for interacting with a cloud"
arch=('any')
url="https://launchpad.net/cloud-utils"
license=('GPL3')
groups=()
depends=(python qemu ca-certificates cdrkit e2fsprogs file util-linux wget)
optdepends=(gptfdisk euca2ools)
provides=(cloud-utils)
conflicts=(cloud-utils-bzr)
replaces=()
source=("https://launchpad.net/cloud-utils/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('63f1dacf5ba761a6f220e6bec83ffb8e')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
