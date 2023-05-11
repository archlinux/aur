# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=blasphemer-wad
pkgver=0.1.8
pkgrel=1
pkgdesc="A free Heretic game data file (IWAD)"
arch=('any')
url='https://github.com/Blasphemer/blasphemer'
license=('BSD')
replaces=('blasphemer')
source=("https://github.com/Blasphemer/blasphemer/releases/download/v${pkgver}/blasphem-${pkgver}.zip"
        "https://raw.githubusercontent.com/Blasphemer/blasphemer/v${pkgver}/COPYING.md")
sha256sums=('5838d211add81e1696a621485c1e40771035daf6609d08bad7018f52acfa5e54'
            '1c985de26efb279ed42f5c8771201580674097eb107e43d385c8b09d13a3c2d2')

package() {
    install "$srcdir"/blasphem.wad -t "$pkgdir"/usr/share/doom -D -m 644
    install "$srcdir"/COPYING.md -t "$pkgdir"/usr/share/licenses/$pkgname -D -m 644
}
