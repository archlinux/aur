# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>

pkgname="ttf-sipa-dip"
pkgver=1.0
pkgrel=2
depends=()
optdepends=("ttf-th-sarabun-new: Improved version of TH SarabunPSK")
pkgdesc="Thai formal standard fonts from SIPA"
arch=("any")
provide=("ttf-font")
license=("custom")
url="http://www.f0nt.com/release/13-free-fonts-from-sipa"
source=("https://jaist.dl.sourceforge.net/project/thaiopensource/font/sipa-dip-font.zip")
sha256sums=("575b7bf6e27a589d754569b608f784b1451ba0b35681a4a3187fd0e9335fb8f0")

package() {
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "${srcdir}/${pkgname}-${pkgver}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
