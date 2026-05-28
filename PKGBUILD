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
sha256sums=('f004a706807b6dbdef375798c5d5bf70eca7ff65a69141dff37eee7b7bdfe9d1')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
