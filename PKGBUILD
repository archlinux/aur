# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>


pkgname=lubuntu-artwork
pkgver=0.64
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4aeb04c1b02ab036601352a4f454111b341bf5a20cdbd9bc678ed7e7ec7cb4ed')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/src/usr" "${pkgdir}"
}
