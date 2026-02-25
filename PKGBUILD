pkgname=ap-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool that packs C assignment submissions for Canvas upload"
arch=('x86_64')
url="https://github.com/cat-forgor/AssignmentPacker"
license=('MIT')
provides=('ap')
conflicts=('ap')
source=("https://github.com/cat-forgor/AssignmentPacker/releases/download/v${pkgver}/ap-linux-x64")
sha256sums=('340655f5fb337fd998d199419da212dfe5883b95ec0c6ecb61c2b14ab3b1591b')

package() {
    install -Dm755 "${srcdir}/ap-linux-x64" "${pkgdir}/usr/bin/ap"
}
