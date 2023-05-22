# Maintainer:  Matthieu Bessat <mail at matthieubessat dot fr>

_pkgbase=ttf-bona-nova
pkgname=($_pkgbase)
pkgver=1.0.0
pkgrel=1
pkgdesc="The Bona Nova font is a remake of the Bona serif typeface designed in 1971 by Andrzej Heidrich, the creator of Polish banknotes"
url="https://github.com/kosmynkab/Bona-Nova"
_commit="a5cbdfb8741af20ea5bfe252f0128beed6c8beed"
arch=("any")
license=("custom:SIL Open Font License v1.1")
source=(
    "BonaNova-Regular-${pkgver}.ttf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/ttf/BonaNova-Regular.ttf"
    "BonaNova-Bold-${pkgver}.ttf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/ttf/BonaNova-Bold.ttf"
    "BonaNova-Italic-${pkgver}.ttf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/ttf/BonaNova-Italic.ttf"

    "OFL.txt::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/OFL.txt"
)
sha256sums=(
    "d72f7715b6b66096e0cc2971e4954f8be33bdced1f143f9c5739a03cdb60bede"
    "c59ccb3ba8f0151236b1b427b58bee0c90607c82ef747cc6e19d5e20138385dd"
    "0d61c160a521b072d1af19e9683754f3f5761bbce35f73fdf091ecdf495bc6c2"

    "38f7dca74a98bbcc13858c9f56e9c7d86e12b4242f2a5ccbecf6e9277c9fd363"
)

package_ttf-bona-nova() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ./OFL.txt
}
