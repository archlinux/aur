# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>

pkgname=tmux-nord-theme
_pkgname=nord-tmux
pkgver=0.3.0
pkgrel=2
pkgdesc='An arctic, north-bluish clean and elegant tmux color theme.'
arch=('any')
url='https://www.nordtheme.com/ports/tmux'
install=$pkgname.install
license=('MIT')
depends=('tmux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arcticicestudio/nord-tmux/archive/v${pkgver}.tar.gz")
sha256sums=('3e9a9d2d6c46995da0ecc3667a182a6c2ca2333b89c83b5f3ea4393014c8bbd9')

package() {
    cd "tmux-${pkgver}"
    install -d "${pkgdir}/usr/share/${_pkgname}"
    cp -r * "${pkgdir}/usr/share/${_pkgname}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
