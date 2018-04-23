# Maintainer: Andrés Cordero <arch@andrew67.com>
# Former Maintainer: halflife <pigoig_At_gmail_com>

pkgname=noto-fonts-sc
pkgver=20170603
pkgrel=2
pkgdesc="Noto CJK-SC fonts for Simplified Chinese"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("https://github.com/googlei18n/noto-cjk/raw/v2017-06-01-serif-cjk-1-1/NotoSansCJKsc-Regular.otf"
        "https://github.com/googlei18n/noto-cjk/raw/v2017-06-01-serif-cjk-1-1/NotoSansMonoCJKsc-Regular.otf")
url="https://github.com/googlei18n/noto-cjk"
install=${pkgname}.install
license=("custom: SIL")
sha256sums=('1652500938055a232cfbfa321de6ebaadfc5635dd9f75e369bc991d14a6512dd'
            '2b1dbdc50df666a00c50ecd77377e2394c6babd35a71e37505ab411ff55c7906')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
