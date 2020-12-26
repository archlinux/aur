# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Former Maintainer: Andrés Cordero <arch@andrew67.com>
# Former Maintainer: halflife <pigoig_At_gmail_com>

pkgname=noto-fonts-sc
pkgver=20201206
_pkgver=v20201206-cjk
pkgrel=5
epoch=2
pkgdesc="Noto CJK-SC fonts for Simplified Chinese"
arch=(any)
depends=()
source=("https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/NotoSansCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/NotoSansMonoCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/LICENSE")
sha256sums=('6895d254d27ea7ac0c022b255d49f82508a52e18a635279d6dcf6702e3d5c68e'
            'a310c9f8cc8e58f90601b2581809fbcf5728799aebb5cce70c8d1255dc968d66'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
url="https://www.google.com/get/noto/help/cjk/"
license=("custom: SIL")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
