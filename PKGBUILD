# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: <ariel.dabalsa@gmail.com>

pkgname=noto-fonts-tc
pkgver=20201206
_pkgver=v20201206-cjk
pkgrel=1
epoch=2
pkgdesc="Noto CJK-TC fonts for Traditional Chinese"
arch=(any)
depends=()
source=("https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/NotoSansCJKtc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/NotoSansMonoCJKtc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/LICENSE")
sha256sums=('8ce2c995cdb87c55801d3a31cab82acc0310809b73b058f948178cc0857010aa'
            '76da3fd1f7bf0ab29fa36b8bb934a5e96c811f4370005e00a75630271287be58'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
url="https://www.google.com/get/noto/help/cjk/"
license=("custom: SIL")

package() {
    install -d "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
