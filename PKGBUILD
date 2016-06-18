# Contributor: orumin <dev@orum.in>

pkgname=ttf-oradano-mincho
upstream_name=OradanoGSRR-2016-0612
pkgver=0.2016.0612
pkgrel=1
pkgdesc="Japanese Serif font from letterpress printing glyph"
arch=('any')
url="http://www.asahi-net.or.jp/~sd5a-ucd/freefonts/Oradano-Mincho/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=("${pkgname}.zip::${url}${upstream_name}.zip")
md5sums=('c7c8f7c35e3f39f64b07c19fd52cb48b')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/Oradano-Mincho/"
    install -m644 "OradanoGSRR.ttf" "${pkgdir}/usr/share/fonts/Oradano-Mincho/"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "README.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
