# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>
# Package Repository: https://github.com/mij-aur-packages/lubuntu-artwork

pkgname=lubuntu-artwork
pkgver=0.61
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('96ac0adc51ffa15a0711e6f7a89e4d3d8df601c36275e41e2a392a644f452a52')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
