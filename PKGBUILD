# Maintainer: Miguel Ángel López <miguel.angel.lopez.vicente@gmail.com>

pkgname=pokenurse-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool for Pokémon Go to aid in transferring and evolving Pokémon (Binary)"
arch=('i686' 'x86_64')
url="https://github.com/vinnymac/PokeNurse"
depends=()

sha256sums_i686=('466c47b7057a4aa1fee7d7476f6ea1bad689a633056fcfd9cce259920f11f6bb')
sha256sums_x86_64=('0bf58bd2213560ceda327c0ae6e2d0309187581bce8908d61e5272ebc375ee52')
source_x86_64=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-x64.deb")
source_i686=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-ia32.deb")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

