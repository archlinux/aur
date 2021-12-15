# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/releases/download/${pkgver}/mint-${pkgver}-linux"
        "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE")
sha256sums=('5ace93f1cf91d022621e1b712fc8d6a2472022f782dd0b09b37f9949c4020d24'
            '6b4ecb1a9202a35540d0405ddd88439bb4644a127afc02ee26428ca5d5c0bd9f')
noextract=("mint-${pkgver}-linux"
           "LICENSE")
conflicts=('mint')

package() {
  cd "${srcdir}"

  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
