# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

pkgname=optimfrog-mime
pkgver=1
pkgrel=1
pkgdesc="MIME type file for OptimFROG"
url='http://www.losslessaudio.org'
license=('custom:OptimFROG')
arch=('any')
depends=(optimfrog)
source=(ofr.xml file-ofr.svg)
sha1sums=(SKIP SKIP)
install=optimfrog-mime.install

package() {
  install -Dm644 ${srcdir}/ofr.xml "${pkgdir}/usr/share/mime/packages/ofr.xml"
  install -Dm644 ${srcdir}/file-ofr.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/file-ofr.svg"
}
