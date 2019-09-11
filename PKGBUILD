# Maintainer: Jorengarenar

pkgname=dgl
_pkgname=DGL
pkgver=0.8.9
pkgrel=1
pkgdesc='Dmenu Game Launcher - use dmenu to launch your games'
arch=('any')
depends=(python
         dmenu)
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/DGL/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$_pkgname-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
