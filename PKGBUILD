# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint
pkgver=0.13.1
pkgrel=6
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("https://github.com/mint-lang/mint/releases/download/${pkgver}/mint-${pkgver}-linux"
        "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE")
sha256sums=('f4264e018a1ee2be3bc9bc84e74e0f198f4258afe14aa1d7bd44edb930307c35'
            '6b4ecb1a9202a35540d0405ddd88439bb4644a127afc02ee26428ca5d5c0bd9f')
noextract=("mint-${pkgver}-linux"
           "LICENSE")

package() {
  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
