# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint-bin
pkgver=0.14.0
pkgrel=2
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("https://github.com/mint-lang/mint/releases/download/${pkgver}/mint-${pkgver}-linux"
        "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE")
sha256sums=('3f40f3666b013fef6d42be0e50ed733ba72dac486ab3ccf1fd7b44b26cbc3ebe'
            '6b4ecb1a9202a35540d0405ddd88439bb4644a127afc02ee26428ca5d5c0bd9f')
noextract=("mint-${pkgver}-linux"
           "LICENSE")
conflicts=('mint')

package() {
  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
