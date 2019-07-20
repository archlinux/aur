# Maintainer: Jorengarenar

pkgname=dgl
epoch=1
pkgver=0.8.3
pkgrel=1
pkgdesc='Dmenu Game Launcher - use dmenu to launch your games'
arch=('any')
depends=('python3')
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/dgl.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname"
    make install
}
