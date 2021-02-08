# Maintainer: Tunacan <tunacanar@gmail.com>

pkgname=earlyoom-openrc
pkgver=20210208
pkgrel=1
pkgdesc="OpenRC earlyoom init script"
arch=('any')
license=('MIT')
groups=('openrc-galaxy')
provides=('openrc-earlyoom')
depends=('openrc' 'earlyoom')
conflicts=('systemd-sysvcompat')
source=("earlyoom.initd")
sha256sums=('934c94e3fcfaaa492a1697607a5e1bcfc71e17c93a9cbc4e2e080a1551e30876')

package(){
    install -Dm755 ${srcdir}/earlyoom.initd ${pkgdir}/etc/init.d/earlyoom
}

