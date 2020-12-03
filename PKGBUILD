# Maintainer: Robin Becker <robin@reportlab.com>
pkgname=mongodb-runit
pkgver=20201203
pkgrel=1
pkgdesc="runit run script for mongodb-bin"
arch=('any')
url="https://github.com/artix-linux"
license=('BSD3')
groups=('runit-world')
depends=()
provides=('mongodb-runscripts')
replaces=('mongodb-runscripts')
conflicts=('systemd-sysvcompat')
source=("mongod.run")
install="mongodb-runit.install"
sha256sums=(
	'49ab180c4ac6771226370268250752e23a089fb99542a08f19cc700bddd74789'
	)

package() {
	install -Dm755 "mongod.run" "$pkgdir/etc/runit/sv/mongod/run"
}
