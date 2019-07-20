# Maintainer: Jorengarenar

pkgname=dgl
epoch=1
pkgver=0.8.5
pkgrel=1
pkgdesc='Dmenu Game Launcher - use dmenu to launch your games'
arch=('any')
depends=('python', 'dmenu-height')
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/dgl.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
