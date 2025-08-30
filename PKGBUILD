pkgname=oshd
pkgver=2.1.0
pkgrel=1
pkgdesc="Odd Static Hosts Daemon"
arch=('any')
url="https://github.com/TheOddCell/oshd"
license=('MIT')
depends=('python3' 'systemd')
makedepends=()
source=('oshctl.py' 'oshd.py' 'oshd.service')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 oshctl.py "$pkgdir/usr/bin/oshctl"
    install -Dm755 oshd.py "$pkgdir/usr/bin/oshd"
    install -Dm644 oshd.service "$pkgdir/etc/systemd/system/oshd.service"
}
