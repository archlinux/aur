# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>
pkgname=owncloud-client-service
pkgver=1.0
pkgrel=1
pkgdesc='Systemd service file for the owncloud client'
arch=('any')
license=(MIT)
groups=()
depends=('owncloud-client')
install="$pkgname.install"
source=('owncloud-client.service')
md5sums=('16f131ea71561ef0cd80271884c3ebca')

package() {
    install -Dm644 $srcdir/owncloud-client.service $pkgdir/usr/lib/systemd/user/owncloud-client.service
}

