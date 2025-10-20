# Maintainer: Frtz Qe <nextlext at gmail dot com>
# Ex-Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=25.10.3
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
sha512sums=('4d580f388e409a3a54bb5eeff0ce553d28520b8ca97b40a21a84a3672706dde49432963547dfab7da639b80eec8cc10e45249be698ffad469f23d70503c1680b')

package(){
    cp -r "${srcdir}/artwork/src/usr" "${pkgdir}"
}
