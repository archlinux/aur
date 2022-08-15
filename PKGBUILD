# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Former Maintainer: Andrés Cordero <arch@andrew67.com>
# Former Maintainer: halflife <pigoig_At_gmail_com>

pkgname=noto-fonts-sc
pkgver=20210430
_pkgver=cee7438f5f8e66397090d483c15275d1af3d87c7
pkgrel=2
epoch=2
pkgdesc="Noto CJK-SC fonts for Simplified Chinese"
arch=(any)
source=("https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/08_NotoSansCJKsc.zip"
        "https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/13_NotoSansMonoCJKsc.zip"
        "https://github.com/googlefonts/noto-cjk/releases/download/Serif2.001/09_NotoSerifCJKsc.zip")
sha256sums=('a927e56f53bd6c3b920bc139c0b94aa36c7d9ad0cf009b159437a1a003581140'
            'e252c39994f8a278676507600a955663c23c24a7827dc63a4300b2f7b427cd5d'
            '0b41bec25868876fe03e71808afdbbc22c401f991d40b0d0c6d7a76b5f504836')
url="https://www.google.com/get/noto/help/cjk/"
license=("custom: SIL")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
    install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -m644 "${srcdir}/OTF/SimplifiedChinese/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
