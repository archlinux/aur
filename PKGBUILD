# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.34
pkgrel=1
pkgdesc="The Jitzu programming language interpreter and shell"
arch=('x86_64')
url="https://github.com/jitzulang/jitzu"
license=('MIT')
provides=('jz')
conflicts=('jz')
depends=('glibc')
options=('!strip')
source=("https://github.com/jitzulang/jitzu/releases/download/v${pkgver}/jitzu-${pkgver}-linux-x64.zip")
sha256sums=('765a0678ab50f5a0b80969e79df3f96e881fff9d8d7eb36b9e78db06aaba2a67')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
