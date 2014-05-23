# Maintainer: lestb <tkhdlstfl.l+aur@gmail.com at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=0.45
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('23bdab2b0731f4df7348cb96661cf23f644bb9d29dfe1f7b5fd521831275dd2f')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/usr" "${pkgdir}"
}
