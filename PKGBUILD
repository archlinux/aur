pkgname=ap-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI tool that packs C assignment submissions for Canvas upload"
arch=('x86_64')
url="https://github.com/cat-forgor/AssignmentPacker"
license=('MIT')
provides=('ap')
conflicts=('ap')
source=("https://github.com/cat-forgor/AssignmentPacker/releases/download/v${pkgver}/ap-linux-x64")
sha256sums=('c8d849188940e3e268b76788e44691d3644d0d50cacf0197bba4e9bf5aead6a8')

package() {
    install -Dm755 "${srcdir}/ap-linux-x64" "${pkgdir}/usr/bin/ap"
}
