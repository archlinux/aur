# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=0.48
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('809e0d4d15b184ef97ec833b2f800c1e7354739e4c4fa7fe5cbf9626a0daf872')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/usr" "${pkgdir}"
}
