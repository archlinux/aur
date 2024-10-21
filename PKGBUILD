# Maintainer: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>
# Contributor: Klimenko Maxim Sergievich <klimenkomaximsergievich@gmail.com>

pkgname=simple-stateful-firewall
pkgver=0.0.15
pkgrel=1
pkgdesc="Simple Stateful Firewall. (GitHub version)"
arch=('i686' 'x86_64')
url="https://github.com/asciiscry3r/simple-stateful-firewall"
license=('GPL2')
depends=('iptables')
optdepends=('opensnitch: Web Application Firewall, but please disable his embedded system firewall.

	     Service reload/stop/start - systemctl restart simplestatefulfirewall.service')
makedepends=('git')
source=("https://github.com/asciiscry3r/simple-stateful-firewall/archive/refs/tags/${pkgver}.tar.gz")
sha1sums=('SKIP')
conflicts=('simple-stateful-firewall')
provides=('simple-stateful-firewall')

package() {
    ls -all
    echo "make DESTDIR="${pkgdir}" install"
    echo "${pkgdir}"
    cd "${pkgname}-${pkgver}" || exit 1
    make DESTDIR="${pkgdir}" install
}
