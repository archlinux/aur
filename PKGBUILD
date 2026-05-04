# Maintainer: Thanh Minh <tmih.real@gmail.com>
pkgname=zkode
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal coding-agent harness"
arch=('x86_64')
url="https://github.com/tmih06/zkode"
license=('MIT')
source=("https://github.com/tmih06/zkode/releases/download/v0.1.0/zkode-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/zkode-linux-x86_64" "${pkgdir}/usr/bin/zkode"
}
