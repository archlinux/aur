# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>

pkgname="ttf-th-sarabun-new"
pkgver=1.35
pkgrel=1
depends=()
optdepends=("ttf-sipa-dip: Thai formal standard fonts from SIPA")
pkgdesc="Improved Thai SIPA TH SarabunPSK font with free license"
arch=("any")
provide=("ttf-font")
license=("GPL")
url="http://www.f0nt.com/release/th-sarabun-new/"
source=("https://www.f0nt.com/download/sipafonts/THSarabunNew.zip")
sha256sums=("7a3db732e475b0b8adb10adf4058e7d8161ecef157f56f9711c229c73bedc592")

package() {
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
