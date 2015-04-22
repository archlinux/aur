# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>
# Package Repository: https://github.com/mij-aur-packages/lubuntu-artwork

pkgname=lubuntu-artwork
pkgver=0.54
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('bff24c0a460aac00aaeb021fe408c935a1f2000c5f4aa00595e89c6470f6bb81')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
