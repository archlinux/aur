# Maintainer: BannedPatriot <realbannedpatriot@protonmail.com>

pkgname=sonobus-aooserver-bin
pkgver=1
pkgrel=1
pkgdesc="Connection server for SonoBus."
arch=('i686' 'x86_64')
url="https://sonobus.net"
license=('GPL3')
depends=('bash')
makedepends=('bash')
source=("git+https://github.com/BannedPatriot/sonobus-aooserver-bin")
sha512sums=('SKIP')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/etc/systemd/system"
    install "$srcdir/sonobus-aooserver-bin/aooserver" "$pkgdir/usr/bin/aooserver"
    install "$srcdir/sonobus-aooserver-bin/aooserver.service" "$pkgdir/etc/systemd/system/aooserver.service"
}
