pkgname=oshd
pkgver=1.0.0
pkgrel=1
pkgdesc="Odd Static Hosts Daemon"
arch=('any')
url="https://github.com/TheOddCell/oshd"
license=('MIT')
depends=('python3' 'systemd')
makedepends=()
source=('oshd.py' 'oshd-clean.service')
sha256sums=('SKIP')

package() {
    install -Dm755 oshd.py "$pkgdir/usr/bin/oshctl"
    install -Dm644 oshd-clean.service "$pkgdir/etc/systemd/system/oshd-clean.service"
}
