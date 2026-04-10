# Maintainer: Simon Curtis <simon@jitzu.dev>
pkgname=jz-bin
pkgver=0.1.20-patch-1
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
sha256sums=('976ab0d502b7831906edc7ffcaf558cc9dc6ac0ea233860e7fdf12bfd08d6087')

package() {
    install -Dm755 jz "${pkgdir}/usr/bin/jz"
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
