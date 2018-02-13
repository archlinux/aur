# Maintainer: unstartdev <guo.yongan@outlook.vom>
pkgname=ioscheduler-aur
pkgver=0.1b1
pkgrel=4
epoch=
pkgdesc="Select ioscheduler"
arch=('any')
url="https://github.com/unstartdev/ioscheduler"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/unstartdev/ioscheduler/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('28364618501176c5fd981072122227bb')
validpgpkeys=()

package() {
	install -Dm755 ioscheduler $pkgdir/usr/lib/systemd/scripts/ioscheduler
	install -Dm644 conffile $pkgdir/etc/default/ioscheduler
	install -Dm644 ioscheduler.service $pkgdir/usr/lib/systemd/system/ioscheduler.service
}
