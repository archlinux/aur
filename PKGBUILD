# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>

pkgname="ttf-th-sarabun-new"
pkgver=2011.06.25
pkgrel=1
depends=("fontconfig" "xorg-font-utils")
optdepends=("ttf-sipa: Thai formal standard fonts from SIPA")
pkgdesc="Improved Thai SIPA TH SarabunPSK font with free license"
arch=("any")
provide=("ttf-font")
license=("GPL")
url="http://www.f0nt.com/release/th-sarabun-new/"
source=("http://www.thailibrary.in.th/wp-content/uploads/2011/12/THSarabunNew.zip")
sha256sums=("4db34af0ccd9dca6e8ba0735af3efb2e10fbb0a95e10387adc7742e4d303bf58")

package() {
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}

