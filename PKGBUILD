# Maintainer: keutain < quentin dot aniere at gmail dot com>

pkgname=wtex
pkgver=0.1.0
pkgrel=1
pkgdesc="Watch LaTeX files and recompile them when they are modified."
arch=(any)
url="https://github.com/qaniere/wtex"
license=('beerware')
depends=('bash' 'inotify-tools')
provides=('wtex')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qaniere/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6a34dc76170a3008a4e5bb76f1de2d8bea85f4e375a94337334c4836eacb4cf0')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/wtex.sh" "${pkgdir}/usr/bin/wtex"
}
