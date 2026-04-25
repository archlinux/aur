# Maintainer: Dawid Majewski <mdawid581 at gmail dot com>
pkgname=aur-kein-git
pkgver=1.1
pkgrel=2
pkgdesc="AUR helper that doesnt use git at all"
arch=('any')
url="https://tklab.eu1.netbird.services/file/My stuff/"
license=('GPL-3.0')
source=("akg")
sha256sums=('SKIP')
depends=('bash')

package() {
	install -Dm755 ./akg "$pkgdir/usr/bin/akg"
}