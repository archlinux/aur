# Maintainer: halflife <pigoig_At_gmail_com>

pkgname=noto-fonts-sc
pkgver=20150617
pkgrel=1
pkgdesc="Noto CJK-SC fonts for Simplified Chinese"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("https://github.com/googlei18n/noto-cjk/raw/master/NotoSansCJKsc-Regular.otf"
        "https://github.com/googlei18n/noto-cjk/raw/master/NotoSansMonoCJKsc-Regular.otf")
url="https://github.com/googlei18n/noto-cjk/archive/v1.004.zip"
install=${pkgname}.install
license=("custom: SIL")
sha256sums=('SKIP'
            'SKIP')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
