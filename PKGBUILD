# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-gelasio-ib
_commit='5bced461d54bcf8e900bb3ba69455af35b0d2ff1'
pkgver=0.2
pkgrel=2
pkgdesc='Gelasio is designed to be metrics compatible with Georgia in its Regular, Bold, Italic and Bold Italic weights. Interpolated Medium, medium Italic, SemiBold and SemiBold Italic have now been added as well.'
arch=('any')
url='http://sorkintype.com/'
license=('custom:SIL Open Font License v1.1')
depends=('xorg-fonts-encodings')
conflicts=()
source=("Gelasio-Bold-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-Bold.ttf"
        "Gelasio-BoldItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-BoldItalic.ttf"
        "Gelasio-Italic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-Italic.ttf"
        "Gelasio-Medium-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-Medium.ttf"
        "Gelasio-MediumItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-MediumItalic.ttf"
        "Gelasio-Regular-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-Regular.ttf"
        "Gelasio-SemiBold-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-SemiBold.ttf"
        "Gelasio-SemiBoldItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/Gelasio-SemiBoldItalic.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/SorkinType/Gelasio/raw/${_commit}/OFL.txt")
sha256sums=('c62de50ae46fcfbc418c5d336f03198d7580683f2935a99b644eb86d472530e8'
            '43c577cd70dcc9cffbf07121e5cc254ceeda13e05d6ac5b0f02791a06c13030f'
            'f41fdb4e8e896c14959a87bf6a8d89d40f9f536da2074f07a3d3773bf55d8041'
            '776312c19720f121cd27cb577edaf3e1979c789c915d6571674930b41eba29ad'
            '1f705ac81086cbc2d018e30c4b4b7f2ce1de82727ba425873d304af84de1a7ba'
            '23f3bd5de8a1e6ae907474d9e4d7775bbfa8706916b8a31d042bc92d5da9fed7'
            '34bee504b523b2024453d7bffb28f33911f8051a27c67763d3c4748e80476e6f'
            '5c560a673b7ee2c7e1d7fa8a8adcf6be825080d4c2176c583809b06cf27b73d1'
            '6a1dfd52df4fe49de2f79250df1c52a910081ee3b8ef68fc6a7817969a44ec2a')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Gelasio-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Bold.ttf"
  install -m 644 Gelasio-BoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-BoldItalic.ttf"
  install -m 644 Gelasio-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Italic.ttf"
  install -m 644 Gelasio-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Medium.ttf"
  install -m 644 Gelasio-MediumItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-MediumItalic.ttf"
  install -m 644 Gelasio-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-Regular.ttf"
  install -m 644 Gelasio-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-SemiBold.ttf"
  install -m 644 Gelasio-SemiBoldItalic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Gelasio-SemiBoldItalic.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
