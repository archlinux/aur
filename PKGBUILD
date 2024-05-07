# Maintainer: keutain < quentin dot aniere at gmail dot com>

pkgname=wtex
pkgver=0.1.1
pkgrel=1
pkgdesc="Watch LaTeX files and recompile them when they are modified."
arch=(any)
url="https://github.com/qaniere/wtex"
license=('beerware')
depends=('bash' 'inotify-tools')
provides=('wtex')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qaniere/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('54ea1248f01363c16b283d27824799c4e0d2e52bbd06974bbf85bb531590dacb')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/wtex.sh" "${pkgdir}/usr/bin/wtex"
}
