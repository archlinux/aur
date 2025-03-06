# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=universal-randomizer
pkgver=4.6.1
pkgrel=1
pkgdesc="Pokemon Universal Randomizer"
arch=(x86_64)
url="https://github.com/Ajarmar/universal-pokemon-randomizer-zx"
license=(GPL)
depends=("java-runtime")
source=("PokeRandoZX.zip::https://github.com/Ajarmar/universal-pokemon-randomizer-zx/releases/download/v4.6.1/PokeRandoZX-v4_6_1.zip"
        "launcher")
sha256sums=('26051fe8a6665ea0582dfcd4d1c3e4889da42a2f731f5fc530fff0cb691a43fd'
            'de3527ccc8ab0d163d47212e286cc255dfb6bf609c236656ad700f789d897683')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/universal-randomizer"
  install -D -m 644 "PokeRandoZX.jar" "${pkgdir}/usr/share/universal-randomizer/PokeRandoZX.jar"
}
