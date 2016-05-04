# Contributor: orumin <dev@orum.in>

pkgname=ttf-myricam
pkgver=2.011.20160403
pkgrel=1
pkgdesc="Japanese TrueType font for developers obtained by mixing Inconsolata and Mgen+"
arch=('any')
url="http://myrica.estable.jp/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=(MyricaM.zip::https://github.com/tomokuni/Myrica/blob/b737107723bfddd917210f979ccc32ab3eb6dc20/product/MyricaM.zip?raw=true)
md5sums=('2cdccb8361be4982257cc2fab4790290')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/MyricaM/"
    install -m644 "MyricaM.TTC" "${pkgdir}/usr/share/fonts/MyricaM"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_Apache.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_M+.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
