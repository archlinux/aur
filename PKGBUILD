# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: Gabriel Moura <g@srmoura.com.br>

pkgname=('webp-thumbnailer')
pkgver='0.0.2'
pkgrel=7
pkgdesc='Creates thumbnails for .webp files'
arch=('i686' 'x86_64')
url='https://github.com/gabrielmoura/webp-thumbnailer'
license=('GPL-3.0')
source=("${pkgname}-master.tar.gz::${url}/archive/master.tar.gz")
md5sums=('03b46f62022c3d0706cad753db655914')

package() {
  install -Dm755 "${srcdir}/${pkgname}-master/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-master/usr/share/thumbnailers/webp.thumbnailer" "${pkgdir}/usr/share/thumbnailers/webp.thumbnailer"
  install -Dm644 "${srcdir}/${pkgname}-master/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: