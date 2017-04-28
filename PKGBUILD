# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=jet
pkgver=1.17.0
pkgrel=1
pkgdesc="A CLI tool designed to make working with Codeship Pro faster and easier"
arch=('x86_64')
url="https://codeship.com"
license=('custom: commercial')
source_x86_64=(https://s3.amazonaws.com/codeship-jet-releases/${pkgver}/jet-linux_amd64_${pkgver}.tar.gz)
md5sums_x86_64=('1ab3ee62290220ed2b8a7e43f8a90085')
package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  install -m755 "${srcdir}/jet" "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/jet "${pkgdir}"/usr/bin/jet
}
