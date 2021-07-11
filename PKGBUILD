# Maintainer: Jorengarenar

pkgname=dgl
_pkgname=DGL
pkgver=0.8.9
pkgrel=2
pkgdesc='Dmenu Game Launcher - use dmenu to launch your games'
arch=('any')
depends=(python dmenu)
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::https://github.com/Jorengarenar/DGL/archive/${pkgver}.tar.gz")
sha512sums=('ba889f8b00deebf8e15ad169fd5120ee327cb8ab4ddd53ff2a5048d576f66e769b5ffd0a442b26055935000d75167d6e59b05a91dd80d8f65b61b28b989eedce')

package() {
    cd "$srcdir/$_pkgname-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
}
