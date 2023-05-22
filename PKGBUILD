# Maintainer:  Matthieu Bessat <mail at matthieubessat dot fr>

_pkgbase=bona-nova
pkgname=(otf-$_pkgbase)
pkgver=1.0.0
pkgrel=1
pkgdesc="The Bona Nova font is a remake of the Bona serif typeface designed in 1971 by Andrzej Heidrich, the creator of Polish banknotes"
url="https://github.com/kosmynkab/Bona-Nova"
_commit="a5cbdfb8741af20ea5bfe252f0128beed6c8beed"
arch=("any")
license=("custom:SIL Open Font License v1.1")
source=(
    "BonaNova-Regular-${pkgver}.otf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/otf/BonaNova-Regular.otf"
    "BonaNova-Bold-${pkgver}.otf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/otf/BonaNova-Bold.otf"
    "BonaNova-Italic-${pkgver}.otf::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/fonts/otf/BonaNova-Italic.otf"

    "OFL.txt::https://github.com/kosmynkab/Bona-Nova/raw/${_commit}/OFL.txt"
)
sha256sums=(
    "ea2894617ead5481de801d7246e9bbeed12601c7cd2d7c6991e4649e0aad8033"
    "dc312544a4dd4c5fcabac4883179ac806b727c12fee9e481289a84c98ce65cee"
    "c5afc99bde6adfaa6a526104da287aaedc8bd04bc52e236e68c3d703fb89d7d4"

    "38f7dca74a98bbcc13858c9f56e9c7d86e12b4242f2a5ccbecf6e9277c9fd363"
)


package_otf-bona-nova() {
  install -Dt "$pkgdir"/usr/share/fonts/OTF -m644 *.otf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 ./OFL.txt
}
