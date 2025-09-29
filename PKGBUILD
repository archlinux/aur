# Maintainer: Frtz Qe <nextlext at gmail dot com>
# Ex-Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=25.10.2
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
sha512sums=('e37fd475d5bac855769ebce20a35cf2f7bc324c85cde6cb1fb811c858ef6e40f294d28b17ca40337fa4b6fd04925c5e3177aef1ba67176548cebd7158aed14c8')

package(){
    cp -r "${srcdir}/artwork/src/usr" "${pkgdir}"
}
