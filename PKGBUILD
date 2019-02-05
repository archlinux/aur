# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
pkgname=gitin
pkgver=0.1.0
pkgrel=1
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('MIT')
depends=('openssl')
source=("https://github.com/isacikgoz/gitin/releases/download/v${pkgver}/gitin_${pkgver}_linux_amd64.tar.gz")
md5sums=('90a010cb45384c8f1687c8ace49ab8c4')

package() {
    install -Dm755 gitin "$pkgdir"/usr/bin/gitin
}
