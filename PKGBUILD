# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=universal-randomizer
pkgver=4.6.0
pkgrel=1
pkgdesc="Pokemon Universal Randomizer"
arch=(x86_64)
url="https://github.com/Ajarmar/universal-pokemon-randomizer-zx"
license=(GPL)
depends=("java-runtime")
source=("PokeRandoZX.zip::https://github.com/Ajarmar/universal-pokemon-randomizer-zx/releases/download/v4.6.0/PokeRandoZX-v4_6_0.zip"
        "launcher")
sha256sums=('d60e8867b05482e8538c1675ad130cc256d045b6f83abea49c18723e0ff0050b'
            'de3527ccc8ab0d163d47212e286cc255dfb6bf609c236656ad700f789d897683')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/universal-randomizer"
  install -D -m 644 "PokeRandoZX.jar" "${pkgdir}/usr/share/universal-randomizer/PokeRandoZX.jar"
}
