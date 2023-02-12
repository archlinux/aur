# Maintainer: Estela ad Astra <i at estela dot cn>

pkgname=xcursor-genshin-nahida
pkgver=1.0
pkgrel=2
pkgdesc="Cursor theme of Nahida from Genshin Impact."
url="https://github.com/SamToki/IconDesign---Sam-Toki-Mouse-Cursors"
arch=('any')
license=('GPL')
depends=('libxcursor')
source=("xcursor-genshin-nahida.tar.gz")

package() {
  install -dm755 "$pkgdir"/usr/share/icons/
  cp -r "$srcdir"/$pkgname "$pkgdir"/usr/share/icons/
}

sha256sums=('8b7de90d5cb766e538f9ce194f89f0be8f18a6c83068e9f3d3799368a3168811')
