# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Lorenzo Carbonell <lorenzo.carbonell.cerezo@gmail.com>
# Contributor: Gabriel Moura <g@srmoura.com.br>

pkgname=('webp-thumbnailer')
pkgver='0.0.2'
pkgrel=6
pkgdesc='Creates thumbnails for .webp files'
arch=('i686' 'x86_64')
url='https://github.com/gabrielmoura/webp-thumbnailer'
license=('GPL3')
source=("${pkgname}-master.tar.gz::${url}/archive/master.tar.gz")
sha512sums=('047d12bf816f3f8de8641bbe15f13147c0342ceafb6f0415e723798ee18a33f1c5ffa85a2ccdda3fe81393aebf89f6a175eea1f80a9cff86b518558b5e56fd49')

package() {
  cd "${pkgname}-master"
  rm README.md
  install -D -m 755 "${srcdir}/${pkgname}-master/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 "usr/share/thumbnailers/webp.thumbnailer" "${pkgdir}/usr/share/thumbnailers/webp.thumbnailer"
  install -D -m 644 "usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright"
}
# vim:set ts=2 sw=2 et:
