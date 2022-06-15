# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=22.10.1
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
sha512sums=('9b2e7616f151ec8f48bc0a5be3c52a30a3f12e3af3629c87777d0de8b4ef72b1cb2afa4c1bd04381834dcde3cd27a14692c0b0e4ea887c947fc55ec1002ceb9e')

package(){
    cp -r "${srcdir}/artwork/src/usr" "${pkgdir}"
}
