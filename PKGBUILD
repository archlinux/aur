# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=universal-randomizer
pkgver=4.5.1
pkgrel=1
pkgdesc="Pokemon Universal Randomizer"
arch=(x86_64)
url="https://github.com/Ajarmar/universal-Pokemon-randomizer-zx"
license=(GPL)
depends=("java-runtime")
source=("PokeRandoZX.jar::https://asunaproject.nl/downloads/PokeRandoZX.jar"
        "launcher_UNIX.sh")
sha256sums=('ea168e846ed2b11fdfe04db66b4d0f507a650fbfd813cdda16c83031a5c55919'
            'f45c68893dbee793ad544c50e2b9727f64cfee63a640b4e0e450b0eabaaca859')

package() {
  install -D -m 755 "launcher_UNIX.sh" "${pkgdir}/usr/bin/universal-randomizer"
  install -D -m 644 "PokeRandoZX.jar" "${pkgdir}/usr/share/universal-randomizer/PokeRandoZX.jar"
}
