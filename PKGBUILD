# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>
pkgname=gitin
pkgver=0.1.3
pkgrel=2
pkgdesc="commit/branch/workdir explorer for git"
arch=('x86_64')
url="https://github.com/isacikgoz/gitin"
license=('MIT')
depends=('openssl')
source=("https://github.com/isacikgoz/gitin/releases/download/v${pkgver}/gitin_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cdf3d331e527da7430cc5b5a18e01fef2c343f52deacff8cadfd94854468218f')

package() {
    install -m755 -D gitin "$pkgdir"/usr/bin/gitin
}
