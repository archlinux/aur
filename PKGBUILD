pkgname=ap-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool that packs C assignment submissions for Canvas upload"
arch=('x86_64')
url="https://github.com/cat-forgor/AssignmentPacker"
license=('MIT')
provides=('ap')
conflicts=('ap')
source=("https://github.com/cat-forgor/AssignmentPacker/releases/download/v${pkgver}/ap-linux-x64")
sha256sums=('0cd9d4580916fbf85bd4f989ad56ec69c12d8f1e3964170665d3386e3ed3a443')

package() {
    install -Dm755 "${srcdir}/ap-linux-x64" "${pkgdir}/usr/bin/ap"
}
