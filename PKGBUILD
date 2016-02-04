# Contributor: orumin <dev@orum.in>

pkgname=ttf-myricam
pkgver=2.010.20160103
pkgrel=2
pkgdesc="Japanese TrueType font for developers obtained by mixing Inconsolata and Mgen+"
arch=('any')
url="http://myrica.estable.jp/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
install=ttf.install
source=(https://github.com/tomokuni/Myrica/raw/master/product/MyricaM.zip)
md5sums=('e74b69150b6c7f14e3c76e167c064d09')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/MyricaM/"
    install -m644 "MyricaM.TTC" "${pkgdir}/usr/share/fonts/MyricaM"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_Apache.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_M+.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "LICENSE_OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
