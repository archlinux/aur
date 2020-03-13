# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint
pkgver=0.8.0
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/${pkgver}/mint-${pkgver}-linux")
sha256sums=('a9c022c97cc468067258022068101ee24196f92002ce24aa405ab5408080f9c6')
noextract=("mint-${pkgver}-linux")
license=('BSD')

package() {
  wget -q "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE"
  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
