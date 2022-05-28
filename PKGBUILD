# Maintainer:  Courtney Swagar <distorto@member.fsf.org>

pkgname=ttf-gelasio-ib
_commit='1f5576c4fe32a29073a64f5ba39d5a684a08fbe9'
pkgver=1.007
pkgrel=1
pkgdesc='Gelasio is designed to be metrics compatible with Georgia in its Regular, Bold, Italic and Bold Italic weights. Interpolated Medium, medium Italic, SemiBold and SemiBold Italic have now been added as well.'
arch=('any')
url='http://sorkintype.com/'
license=('custom:SIL Open Font License v1.1')
source=("Gelasio-Bold-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-Bold.ttf"
        "Gelasio-BoldItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-BoldItalic.ttf"
        "Gelasio-Italic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-Italic.ttf"
        "Gelasio-Medium-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-Medium.ttf"
        "Gelasio-MediumItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-MediumItalic.ttf"
        "Gelasio-Regular-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-Regular.ttf"
        "Gelasio-SemiBold-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-SemiBold.ttf"
        "Gelasio-SemiBoldItalic-${pkgver}.ttf::https://github.com/SorkinType/Gelasio/raw/${_commit}/fonts/ttf/Gelasio-SemiBoldItalic.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/SorkinType/Gelasio/raw/${_commit}/OFL.txt")
sha256sums=('f0f018b36fb57c95c575654cd3ab9c43a4ab984c42bdaeb5bcec261290e10105'
            'b20fceb4d9f8446be1507c7446894688966073a438d17a807a5a7b47ceb8728f'
            'f39d48c9ffef78a031aef30b811f5ffcdb3cbb60d40ceb803be6fed2c3987f4c'
            '2cb138d9fe3c55be829c0c5119f7c902bbef9312593515f0b2b0c8c9ba324ffc'
            '1ffaf1b705a67bcbde0c1c966cc554bbb5cf760e46f70ecd34b44abcf11a6dc2'
            'affcbda0d2f892c0cfe8677f53576662d9011e20c63846d0efadaca67237a3c8'
            'd622928b653e830f5a7af6a16558bc2952936983fd0db567af2da6fadac5980a'
            '4662a4bb224c3b13e018104eee01ebea59252deb1fc20f8c40846811cd6d463d'
            'bed1e522a09bb89b7e3fc40d29b17d97ac8e139bb049e2514c33c7792c246027')

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
