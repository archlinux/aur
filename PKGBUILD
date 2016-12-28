# Maintainer: <ariel.dabalsa@gmail.com>

pkgname=noto-fonts-tc
pkgver=20150617
pkgrel=1
pkgdesc="Noto CJK-TC fonts for Traditional Chinese"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("https://github.com/googlei18n/noto-cjk/raw/master/NotoSansCJKtc-Regular.otf"
        "https://github.com/googlei18n/noto-cjk/raw/master/NotoSansMonoCJKtc-Regular.otf")
url="https://github.com/googlei18n/noto-cjk/archive/v1.004.zip"
install=${pkgname}.install
license=("custom: SIL")
sha1sums=('SKIP' 'SKIP')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
