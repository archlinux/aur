pkgname="imouto-cursor-theme"
pkgver=1.0
pkgrel=1
pkgdesc="Imouto animated cursor theme (XCursor)"
arch=("any")
url="https://github.com/src-06/${pkgname}"
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
options=('!strip')
sha256sums=("76bb70f0d00e23d7371fabd9eecfd230f307d7337ab516afa3d847e5c93ef81a")

package() {
  install -dm755 "${pkgdir}/usr/share/icons/Imouto"
  cp -a "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/share/icons/Imouto/"
}
