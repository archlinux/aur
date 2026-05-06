# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.28
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
sha256sums=('68ebd2964d3c8052ef529b8f0f61adfd52cdf47d95ee168edd8b2ae0a8dbd4b3')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
