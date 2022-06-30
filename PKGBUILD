# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=blasphemer-wad
pkgver=0.1.7
pkgrel=1
pkgdesc="A free Heretic game data file (IWAD)"
arch=('any')
url='https://github.com/Blasphemer/blasphemer'
license=('BSD')
replaces=('blasphemer')
source=("https://github.com/Blasphemer/blasphemer/releases/download/v${pkgver}/blasphem-${pkgver}.zip"
        "https://raw.githubusercontent.com/Blasphemer/blasphemer/v${pkgver}/COPYING.md")
sha256sums=('7c93e5b6d6133c83cefb171e47502d57d53ecefc1fe38b5a1d2a19160d011488'
            '1c985de26efb279ed42f5c8771201580674097eb107e43d385c8b09d13a3c2d2')

package() {
    install "$srcdir"/blasphem-${pkgver}.wad "$pkgdir"/usr/share/doom/blasphem.wad -D -m 644
    install "$srcdir"/COPYING.md -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
