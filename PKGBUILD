# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>


pkgname=lubuntu-artwork
pkgver=0.66
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('15e8fe76b1305da1972091360cc5a66272f4c0e6ebfc22e02c12724125e5862522cbf4a52117e0c5aeb0ab4e6f37397914373e274a04a569bc0a8b0a9db3cbee')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
