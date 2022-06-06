# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=posy-improved-cursors
pkgver=1.4
pkgrel=1
pkgdesc="Posy's improved cursors by Michiel de Boer, available as cursor themes."
arch=(any)
url="https://github.com/simtrami/posy-improved-cursor-linux"
license=(unknown)
source=("https://github.com/simtrami/posy-improved-cursor-linux/archive/refs/tags/${pkgver}.tar.gz")
provides=('posy-cursors')
conflicts=('posy-cursors')
sha256sums=('343011eb42b78871f0343c1d7911abea10a05d6baf4089dcabb9f081d32d4ce1')

package() {
  cd "${srcdir}/posy-improved-cursor-linux-${pkgver}"
  install -Ddm755 "${pkgdir}/usr/share/icons"
  for variant in "Posy's Cursor" "Posy's Cursor Black" "Posy's Cursor Mono" "Posy's Cursor Mono Black" "Posy's Cursor Strokeless" ; do
    cp -dr --no-preserve=ownership "${variant}" "${pkgdir}/usr/share/icons/"
  done
}
