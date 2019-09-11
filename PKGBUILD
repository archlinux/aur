# Maintainer: Jorengarenar

pkgname=dgl-git
_pkgname=dgl
pkgver=0.8.9
pkgrel=1
pkgdesc='Dmenu Game Launcher - use dmenu to launch your games'
arch=('any')
depends=(python
         dmenu)
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/dgl.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $_pkgname "${pkgdir}/usr/bin"
}
