# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Former Maintainer: Andrés Cordero <arch@andrew67.com>
# Former Maintainer: halflife <pigoig_At_gmail_com>

pkgname=noto-fonts-sc
pkgver=2.001
pkgrel=4
epoch=1
pkgdesc="Noto CJK-SC fonts for Simplified Chinese"
arch=(any)
depends=()
source=("https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/NotoSansCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/NotoSansMonoCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/LICENSE")
sha256sums=('ee85a1e4126e287a373625cce025b3235cdebf96f71b78f5ef165893c6f8c99f'
            '1be3c018da41e6545090882625457c9a5d01a03a9115a6be49820d154585989a'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
url="https://www.google.com/get/noto/help/cjk/"
install=${pkgname}.install
license=("custom: SIL")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
