# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: <ariel.dabalsa@gmail.com>

pkgname=noto-fonts-tc
pkgver=2.001
pkgrel=1
epoch=1
pkgdesc="Noto CJK-TC fonts for Traditional Chinese"
arch=(any)
depends=()
source=("https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/NotoSansCJKtc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/NotoSansMonoCJKtc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/NotoSansV2.001/LICENSE")
sha256sums=('273c0dca7aee567ff3b77dc30735631b49f8821e77b1175a4a7c89ef987549a8'
            '4e1bf51454677d918bff7438f9e7013bc02ad730c0a0f6ab0826b27fea9cdd6c'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
url="https://www.google.com/get/noto/help/cjk/"
license=("custom: SIL")

package() {
    install -d "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
