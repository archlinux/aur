# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=pokemmo-deb
pkgver=1.4_1
pkgrel=1
pkgdesc="An MMO based on the Pokémon Universe."
arch=('x86_64')
url="https://pokemmo.eu"
install=pokemmo-deb.install
license=('custom')
depends=('java-runtime-common')
source=(https://dl.pokemmo.eu/download/pokemmo-launcher_${pkgver//_/-}.deb)
md5sums=('6bf53a77e50effd31091c66e9d100e32')

package()   {
    tar xf data.tar.xz
    cp --preserve=mode -r usr "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

