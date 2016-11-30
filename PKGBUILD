# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>


pkgname=lubuntu-artwork
pkgver=0.65
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('260c9afcf139668fe6cfabf69ead13dfc35fe3659814e9868d7895173296cdda6506fd87a13c8cb8f3cf58b45833c9b4ce18dd68d0508f5a5b112ecca40f044a')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
