# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
pkgname=gitin
pkgver=0.1.3
pkgrel=1
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('MIT')
depends=('openssl')
source=("https://github.com/isacikgoz/gitin/releases/download/v${pkgver}/gitin_${pkgver}_linux_amd64.tar.gz")
md5sums=('d82720188aefbf79851b903fa4cdaba9')

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
}
