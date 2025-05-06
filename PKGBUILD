# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint-bin
pkgver=0.24.1
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/releases/download/${pkgver}/mint-${pkgver}-linux-${arch}"
        "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE")
sha256sums=('97bbd6005d9f93681af1f30ac529fc1489ba428cd08e7c803fcdb3b262a72090'
            '6b4ecb1a9202a35540d0405ddd88439bb4644a127afc02ee26428ca5d5c0bd9f')
noextract=("mint-${pkgver}-linux-${arch}"
           "LICENSE")
conflicts=('mint')

package() {
  cd "${srcdir}"

  install -Dm755 "mint-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
