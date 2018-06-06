# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Elena ``of Valhalla'' Grandi <gmail.com: elena.valhalla>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ttf-symbola
pkgver=11.00
pkgrel=2
pkgdesc="Font for unicode symbols (part of Unicode Fonts for Ancient Scripts)."
arch=('any')
conflicts=('ttf-symbola-ib')
provides=('ttf-symbola')
url="http://users.teilar.gr/~g1951d/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::http://users.teilar.gr/~g1951d/Symbola.zip"
        "LICENSE")
sha512sums=('d1cf09eb87be4d302a790b25b31f874eb8b1b8e766d94db78ba45084791eaf13d04ad0c61d7fb0848e243fd84b3b1639c71239854c3eca2cf0e81b128c1f0738'
            '9afe91785611955511248fd31a86c7e370b23b1b2c37f9345c8f274b3e0e1dbf9c0da8f9edac62d27d318e56485b80966aa7622f167f4da5d5925a7935bfa3da')

package() {
  install -Dm644 Symbola.ttf "$pkgdir/usr/share/fonts/TTF/Symbola.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
