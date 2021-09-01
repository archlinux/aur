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
source=("https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Bold.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-DemiLight.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Light.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Medium.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/OTF/SimplifiedChinese/NotoSansCJKsc-Thin.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-Bold.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-SemiBold.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-Black.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-Light.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-Medium.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Serif/NotoSerifCJKsc-ExtraLight.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/Mono/NotoSansMonoCJKsc-Regular.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/Sans/Mono/NotoSansMonoCJKsc-Bold.otf"
        "https://github.com/googlefonts/noto-cjk/raw/${_pkgver}/LICENSE")
sha256sums=('2c76254f6fc379fddfce0a7e84fb5385bb135d3e399294f6eeb6680d0365b74b'
            'b5f0d1a190a7f9b43c310a8850630af12553df32c4c050543f9059732d9b4c0a'
            '4600700d1b10c8e82074de7c91fa60d2ff5d0a7b9588edea6ab0929424b1699f'
            'e78bbbe1573bbb006156c1198f5c8cd6329470cb6e0b6702c7a3c83913db4abf'
            'ca094f6b0001fb048ca39ddd797a0cdb0179e1e55c6561e111c49c3e6a61d7b7'
            '89bb8179d1b285ac0ca236b37ff29929ee3cc4526048dc11630a55728063e5ba'
            'efa5e49879a789c1ecad8f07e1813c7f9aa6c4b951fdbb5791d85d67345632d7'
            '2dcb7dd34444afc79fce6c2f67afe018b6bbe87af98bf0918d7316c58416157b'
            'e3e030ed7420c96c465a6afccfecfa83739797d7854f8e3c89f6ac4d73af0338'
            '94ef86d2807b81a0db8f596ff0e50130b9744da61b71000e77087aaf38418c02'
            'e5880b655a78ab15ef0ebd807b6d0f049d5668674c11f49ca3473aedb3e0cadc'
            '3405a99c1fc545672b919d55acc61ff749dd54e577a893b43a4dc99d11b4c6cf'
            '2cc0582da264c9038c75a766a78bf645567c8c552f36b98901b3c43b11bd8fa5'
            'ec04cc376b34887cedbdf84074e2e226ed2761eeabdcb9173fc1dd7bfd153ef7'
            'a452fedfc0619e43e080b7b861ce34cbd3ec4fbcea495bf8c402a5a02a5dcbdc'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
url="https://www.google.com/get/noto/help/cjk/"
license=("custom: SIL")

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF"
	install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 "${srcdir}/"LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
