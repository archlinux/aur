# Maintainer: Victor Rouquette <victor@rouquette.me>

pkgname=ttf-exo2-variable
_commit='182060cd38adf3cde0d22add3f8009d30bd48cde'
pkgver=1.0
pkgrel=1
pkgdesc='Exo 2 is a complete redrawing of Exo, a contemporary geometric sans serif typeface that tries to convey a technological/futuristic feeling while keeping an elegant design.'
arch=('any')
url='https://www.ndiscover.com/exo-2-0/'
license=('custom:SIL Open Font License v1.1')
source=("Exo2-Italic-${pkgver}.ttf::https://github.com/NDISCOVER/Exo-2.0/raw/${_commit}/fonts/variable/Exo2-Italic%5Bwght%5D.ttf"
        "Exo2-${pkgver}.ttf::https://github.com/NDISCOVER/Exo-2.0/raw/${_commit}/fonts/variable/Exo2%5Bwght%5D.ttf"
        "${pkgname}-${pkgver}-OFL.txt::https://github.com/NDISCOVER/Exo-2.0/raw/${_commit}/OFL.txt")
md5sums=('74a65f4f3ff2bcf882dacf088b357e15'
         '4d187c8ecd44a514282634d865a2c5df'
         '3942ce5f1f8a72654618d8a3e7d31bad')
sha256sums=('6b8089c27e1a29b3c7e22eade6190f5c756d0abdd20a0d5c736afdec6d29a942'
            '6dc268b35134ea07db4ea6b19c965bc82e650cefbd1e4f8fb265bfc4e630c897'
            'cecc43de8bf5449d88fb03a6d33b0b569df304545d3b57760863e833a6434d45')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 Exo2-Italic-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Exo2-Italic.ttf"
  install -m 644 Exo2-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/Exo2.ttf"
  install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
