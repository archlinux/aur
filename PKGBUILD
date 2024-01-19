# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=24.04.3
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
sha512sums=('75f64e003e7b230f032ba6b3a823d10e96b8373c7a26841a3073ac6f6c716242f83c0267941c1854d2e39068a77fc77f54d045d9d15dab390e6ae332e3644c1d')

package(){
    cp -r "${srcdir}/artwork/src/usr" "${pkgdir}"
}
