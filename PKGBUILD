# Maintainer: lestb <tkhdlstfl.l+aur@gmail.com at gmail dot com>
# Contributor: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=0.47
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
            'elementary-icon-theme: icons support'
            'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('3b14f1e6d13f3e07b53d1c3f2f40441fbee00f432575aac3eb14448698294b60')

package(){
    cp -r "${srcdir}/${pkgname}-${pkgver}/usr" "${pkgdir}"
}
