# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>
# Contributor: Faustino Aguilar <faustinoaq.github.io>

pkgname=mint
pkgver=0.7.1
pkgrel=2
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
source=("https://github.com/mint-lang/mint/releases/download/${pkgver}/mint-${pkgver}-linux")
sha256sums=('7749ad65c5f201226f2aef2fe44f904b80102bdb7631b28a6cee1f2576c63ffd')
noextract=("mint-${pkgver}-linux")
license=('BSD')

package() {
  wget -q "https://raw.githubusercontent.com/mint-lang/mint/master/LICENSE"
  install -Dm755 "mint-${pkgver}-linux" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
