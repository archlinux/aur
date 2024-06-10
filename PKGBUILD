# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>

pkgname="ttf-sipa-dip"
pkgver=1.0
pkgrel=3
depends=()
pkgdesc="Thai formal standard fonts from SIPA, including Sarabun"
arch=("any")
provide=("ttf-font")
license=("custom")
url="http://www.f0nt.com/release/13-free-fonts-from-sipa"
source=("https://waa.inter.nstda.or.th/stks/pub/2020/20200217-13Fonts.zip")
sha256sums=("a153619f1b248d43ba4145337984c09b8ca375ba6319d8cd780a5502df5b720d")

package() {
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 "${srcdir}/Fonts/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
