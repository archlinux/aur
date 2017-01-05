# Maintainer: Miguel Ángel López <miguel.angel.lopez.vicente@gmail.com>

pkgname=pokenurse-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A tool for Pokémon Go to aid in transferring and evolving Pokémon (Binary)"
arch=('i686' 'x86_64')
url="https://github.com/vinnymac/PokeNurse"
depends=()

sha256sums_i686=('0fed8bc5e27666af51244936e72956c1fcd5b5f55d6dff0b848c1fa51beef377')
sha256sums_x86_64=('15416d87c4c609755930e0151eb68e05371d4289d996832e9f8ee4bbb1ad29b3')
source_x86_64=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-x64.deb")
source_i686=("https://github.com/vinnymac/PokeNurse/releases/download/v${pkgver}/PokeNurse-ia32.deb")

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

