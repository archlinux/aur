# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: Gabriel Moura <g@srmoura.com.br>

pkgname=('webp-thumbnailer')
pkgver='0.0.2'
pkgrel=7
pkgdesc='Creates thumbnails for .webp files'
arch=('any')
url='https://github.com/gabrielmoura/webp-thumbnailer'
license=('GPL3')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/master.tar.gz")
sha256sums=('0b4e3c247dd5896d3b7c4e72a120d7fa2d010c57990d5c3cbf563c2b898ef53b')

package() {
  install -Dm755 "${srcdir}/${pkgname}-master/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-master/usr/share/thumbnailers/webp.thumbnailer" "${pkgdir}/usr/share/thumbnailers/webp.thumbnailer"
}
# vim:set ts=2 sw=2 et: