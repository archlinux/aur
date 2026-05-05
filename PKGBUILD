# Maintainer: Thanh Minh <tmih.real@gmail.com>
pkgname=zkode-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal coding-agent harness (prebuilt binary)"
arch=('x86_64')
url="https://github.com/tmih06/zkode"
license=('MIT')
provides=('zkode')
conflicts=('zkode')
source=("https://github.com/tmih06/zkode/releases/download/v0.1.0/zkode-linux-x86_64.tar.gz")
sha256sums=('7137c4313ea6273f9e3df964c924e9d74a8bb0b33954eceb5b109c1449b02603')

package() {
    install -Dm755 "${srcdir}/zkode-linux-x86_64" "${pkgdir}/usr/bin/zkode"
}
