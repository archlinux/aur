# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=1.6
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
options=(!strip)
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('c431132e4cb52e90fa886ce8094934f5ff313fc886aaed9248af5bc8359d17697270160cff588291de6b7496807c26d5c41b1b44cb8c57f6f44c9636001d1eb8')

package(){
    cp -r "${srcdir}/${pkgname}/src/usr" "${pkgdir}"
}
