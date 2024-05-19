# Maintainer: Dringsim <dringsim@qq.com>

pkgname=binfmt-php
pkgver=1
pkgrel=1
pkgdesc="Register PHP interpreter"
arch=('any')
url="http://www.freedesktop.org/software/systemd/man/binfmt.d.html"
license=('Unlicense')
depends=('php')
source=('php.conf')
sha256sums=('f7083a0bbe66c7c01154168b652292832188795585427a165eb85022bc5cd29d')

package() {
    install -Dm644 'php.conf' "$pkgdir/usr/lib/binfmt.d/php.conf"
}
