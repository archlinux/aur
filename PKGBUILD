# Maintainer: Mike Patton <mike@myowncyber.space>
pkgname=u2f-hidraw-policy
pkgver=1.0.2
pkgrel=1
pkgdesc="Another UDEV rule for U2F devices."
arch=('x86_64')
url="https://github.com/amluto/u2f-hidraw-policy"
license=('LGPL2.1')
depends=('libsystemd')
conflicts=('libu2f-host' 'libu2f-host-git' 'u2f-udev-rules-git')
source=("git+https://github.com/amluto/u2f-hidraw-policy.git")

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/usr/" install
}
md5sums=('SKIP')
