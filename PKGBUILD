# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint-bin
pkgver=0.15.2
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/releases/download/${pkgver}/mint-${pkgver}-linux"
        "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE")
sha256sums=('6ae41d84f0c66fe65ef87bf50291f666c1c6d4ca8e127c8659a6460efabea52e'
            '6b4ecb1a9202a35540d0405ddd88439bb4644a127afc02ee26428ca5d5c0bd9f')
noextract=("mint-${pkgver}-linux"
           "LICENSE")
conflicts=('mint')

package() {
  cd "${srcdir}"

  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
