# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.49
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
sha256sums=('f1659e2a8c0a9ddfafd04c292cd0c6d8c187f99497d9698d9d3c58dd1f8154d2')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
