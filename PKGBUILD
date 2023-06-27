# Maintainer: smowtenshi <smowtenshi at protonmail dot com>
# Contributor: Asim Bera <asimbera at outlook dot in>


pkgname=linux-lunacy-bin
_pkgname=lunacy
pkgver=9.1.1
pkgrel=1
pkgdesc="Free design software that keeps your flow with AI tools and built-in graphics"
arch=('x86_64')
url="https://icons8.com/lunacy"
license=('custom: commercial')
depends=('gcc-libs' 'hicolor-icon-theme' 'zlib' 'fontconfig')
provides=('lunacy')
source_x86_64=(https://gitcode.net/dnrops/lunacy-bin/-/raw/master/lunacy-bin-9.1.1-1-x86_64.pkg.tar.zst)
sha256sums_x86_64=('SKIP')

package() {
    cd "$srcdir"
    sudo pacman -U "${srcdir}/lunacy-bin-9.1.1-1-x86_64.pkg.tar.zst" --noconfirm
}
