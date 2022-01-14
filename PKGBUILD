# Maintainer: r4v3n6101

pkgname=makepkg-sccache-link
pkgver=1.0.0
pkgrel=1
pkgdesc="Link sccache with ccache making it available to makepkg"
arch=('any')
depends=('sccache')
conflicts=('ccache')
source=('ccache')
md5sums=('200f4d8423fc6cd066a781a6dfb06486')

package() {
    cd $srcdir
    install -Dm 755 ccache "${pkgdir}/usr/bin/ccache"
}
