# Contributor: orumin <dev@orum.in>

pkgname=ttf-oradano-mincho
upstream_name=Oradano2016-0427t
pkgver=0.2016.0427
pkgrel=1
pkgdesc="Japanese Serif font from letterpress printing glyph"
arch=('any')
url="http://www.asahi-net.or.jp/~sd5a-ucd/freefonts/Oradano-Mincho/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=("${pkgname}.zip::${url}${upstream_name}.zip")
md5sums=('bd5ad559afb50c525c1f698631945e11')

package() {
    cd "${srcdir}/${upstream_name}"

    install -d "${pkgdir}/usr/share/fonts/Oradano-Mincho/"
    install -m644 "Oradano-mincho-t.ttf" "${pkgdir}/usr/share/fonts/Oradano-Mincho/"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "README.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
