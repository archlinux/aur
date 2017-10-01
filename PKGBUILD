# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=0.69
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha512sums=('aebb0bec4c86535844c081e895b9bbf363a40fab01e7e7878cdbcfa86f8b4d4432b58145b2b8264720490ad9670059b699eac05354f3fad5b5e180c9422db205')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
