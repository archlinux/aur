
pkgname=ttf-proza-libre
_commit='45ea7bb14c2301988fbda75fc27374f63e33c19c'
pkgver=1.0.r12.g45ea7bb
pkgrel=3
pkgdesc='A typeface that is pleasant to read on screens across different operating systems, by Bureau Roffa'
arch=('any')
url='https://github.com/jasperdewaard/Proza-Libre'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig')
source=("ProzaLibre-Bold.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-Bold.ttf"
        "ProzaLibre-BoldItalic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-BoldItalic.ttf"
        "ProzaLibre-ExtraBold.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-ExtraBold.ttf"
        "ProzaLibre-ExtraBoldItalic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-ExtraBoldItalic.ttf"
        "ProzaLibre-Italic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-Italic.ttf"
        "ProzaLibre-Light.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-Light.ttf"
        "ProzaLibre-LightItalic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-LightItalic.ttf"
        "ProzaLibre-Medium.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-Medium.ttf"
        "ProzaLibre-MediumItalic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-MediumItalic.ttf"
        "ProzaLibre-Regular.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-Regular.ttf"
        "ProzaLibre-SemiBold.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-SemiBold.ttf"
        "ProzaLibre-SemiBoldItalic.ttf::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/Fonts/ProzaLibre-SemiBoldItalic.ttf"
        "${pkgname}-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/jasperdewaard/Proza-Libre/${_commit}/LICENSE.md")
sha256sums=('ce69f7ebd2c60525cc788377ef009d4436706f7f284b20f4d721e2d69da010d1'
            '8e316c3d2a180484ebf968a3a5298f4c5de205c6a80b207c525dd18b42e86f77'
            '7fb522bfb06eb9d66258caf9c32296b76ee051febc87a557716c0f10e6377a29'
            'd3c8c789986d6b10102a968c044d890c0ffe3eb3b906c22e25b1aabbdae2a415'
            '819e712675d41b1bded0f346e652212abec74b9cca94d82e6e181a4f4968f9f2'
            '0ba41792e881396b2eaff62540cabb46e3e62b3c96ab381d6f4cd2070fd7c888'
            '6d20a827187cf57a3f0ab216fc67e68bc2674f1d1a5fa9c5cf630f9b5cb95c49'
            '43be713fabac19cc58eff08dffd9af9bc9e18d4e336b3aacf4e2ac62aea64452'
            '2fcb417416fe9dc6819bfb4193f90c88bb3920920d7ed3bf1571ab3cb49c7fc6'
            'a48133d1b0d152f7b5456ba2dcaf69f87cd1a111f04c871806dbfb2ddb4d6cac'
            'dacf0374fc4c9622188bc83e53898b2f4b6b0c6ce2547d27cda1446c095e7ba8'
            '8019b6c5b7f21a13f2d15292dd702ab8d258302c8951e49d4062fb64e8632b5f'
            'c8a085cfcdc3c28d7afd86e0266a91dec3efba6aaf5357cd94711df34bdacd92')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/${pkgname}"
  install -m 664 ProzaLibre-Bold.ttf            "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-Bold.ttf"
  install -m 664 ProzaLibre-BoldItalic.ttf      "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-BoldItalic.ttf"
  install -m 664 ProzaLibre-ExtraBold.ttf       "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-ExtraBold.ttf"
  install -m 664 ProzaLibre-ExtraBoldItalic.ttf "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-ExtraBoldItalic.ttf"
  install -m 664 ProzaLibre-Italic.ttf          "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-Italic.ttf"
  install -m 664 ProzaLibre-Light.ttf           "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-Light.ttf"
  install -m 664 ProzaLibre-LightItalic.ttf     "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-LightItalic.ttf"
  install -m 664 ProzaLibre-Medium.ttf          "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-Medium.ttf"
  install -m 664 ProzaLibre-MediumItalic.ttf    "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-MediumItalic.ttf"
  install -m 664 ProzaLibre-Regular.ttf         "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-Regular.ttf"
  install -m 664 ProzaLibre-SemiBold.ttf        "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-SemiBold.ttf"
  install -m 664 ProzaLibre-SemiBoldItalic.ttf  "${pkgdir}/usr/share/fonts/${pkgname}/ProzaLibre-SemiBoldItalic.ttf"
  install -Dm644 ${pkgname}-${pkgver}-LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
