# Maintainer: Emma Tebibyte <emma@tebibyte.media>

pkgname="xdg-sanity"
pkgver=0.1
pkgrel=1
pkgdesc="A tool to sanely open http/s links."
arch=("any")
url="https://git.tebibyte.media/emma/xdg-sanity"
license=("AGPL3")
source=("git+https://git.tebibyte.media/emma/xdg-sanity.git")

depends=("handlr")
makedepends=("git")
provides=("xdg-sanity")

sha256sums=("SKIP")

package() {
  cd $srcdir/
  mkdir -p "${pkgdir}/usr/local/bin"
  mv "${srcdir}/${pkgname}/xdg-sanity.sh" "${pkgdir}/usr/local/bin"
}