# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=1.8
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
sha512sums=('5d3c621f2db62713bc786b0616a84aef6890ebdae8a7eea131b3c5cb00fb397891b514d8128ddeff07c374a4ceac2dc154bedebf038f532b609ac6e24b555377')

package(){
    cp -r "${srcdir}/${pkgname}/src/usr" "${pkgdir}"
}
