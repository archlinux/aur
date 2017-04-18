# Maintainer: Nathan Lowe <techwiz96@gmail.com>
pkgname=yarnpkg
pkgver=0.23.2
pkgrel=1
pkgdesc="Fast, reliable, and secure dependency management"
arch=('i686' 'x86_64')
depends=('nodejs')
url="https://yarnpkg.com/en/"
license=('MIT')
source=("yarnpkg_${pkgver}_all.deb::https://github.com/yarnpkg/yarn/releases/download/v${pkgver}/yarn_${pkgver}_all.deb")
sha256sums=('f4bcdee3918a91fa9115c43dc1df33da830c147aa259ca936a0ce2f733191cf4')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
