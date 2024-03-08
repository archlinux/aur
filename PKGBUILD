# Maintainer:  Leopold Fajtak <maintainer.u2dut@aleeas.com>

pkgname=ttf-dosis
_commit='3407d52f1d1b1c36c14e756ad0b36561d8d44a3b'
pkgver=1.000
pkgrel=1
pkgdesc='by Edgar Tolentino, Pablo Impallari, Igino Marini'
arch=('any')
url='https://fonts.google.com/specimen/Dosis'
license=('custom:SIL Open Font License v1.1')
conflicts=()
source=("Dosis-Bold-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-Bold.ttf"
        "Dosis-ExtraBold-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-ExtraBold.ttf"
        "Dosis-ExtraLight-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-ExtraLight.ttf"
        "Dosis-Light-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-Light.ttf"
        "Dosis-Medium-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-Medium.ttf"
        "Dosis-Regular-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-Regular.ttf"
        "Dosis-SemiBold-${pkgver}.ttf::https://github.com/googlefonts/dosis-vf/raw/${_commit}/fonts/ttf/Dosis-SemiBold.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/googlefonts/dosis-vf/raw/${_commit}/OFL.txt")
sha256sums=('136c4e90a66432cc5014da5d47f436bcd521759c641ae4f52814d18a50d265ec'
            '9d097d5da1fb331eb050a0fa761c915c3c91be7d9b6fbab09232f16d506c6614'
            'e02b7683565a01fd373cb2605fefc34c680f15d033e8b341a862a995841b5d33'
            '6bbcc7b146dd7df81ba69d93ad958f037614cd504ad00835cdcf98b7aa8f988e'
            '40a6bd332c9494dd008e1503a7a343d6dae4f6b4b1c2bc8bef063235cc823c3c'
            'ecc46c2075fdc6c46b9a41e8870f4527eabafa4f7caae6b2bc1b15b894c3df75'
            '7f23e4ef818aa5774bd4f3ab11c846d0dff72d5557e1c3fa8393357a5f16d709'
            '6dfa3951f0c829518b284608fcc1acb196cba1536b1ae1713a49deccde1ccc53')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Dosis-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-Bold.ttf"
  install -m 644 Dosis-ExtraBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-ExtraBold.ttf"
  install -m 644 Dosis-ExtraLight-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-ExtraLight.ttf"
  install -m 644 Dosis-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-Light.ttf"
  install -m 644 Dosis-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-Medium.ttf"
  install -m 644 Dosis-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-Regular.ttf"
  install -m 644 Dosis-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Dosis-SemiBold.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
