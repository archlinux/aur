# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
pkgname=gitin
pkgver=0.1.4
pkgrel=1
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('MIT')
depends=('openssl')
source=("https://github.com/isacikgoz/gitin/releases/download/v${pkgver}/gitin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4be066935692a1a032e4a81bafbddbcb75bacb2ef506622615f18206f920f58a')

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
}
