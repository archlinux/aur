# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=pdf-redact-tools
pkgver=0.1.2
pkgrel=1
pkgdesc="Securely redact and strip metadata from docs before publishing"
arch=('any')
url="https://github.com/firstlook/pdf-redact-tools"
license=(GPLv3)
depends=('python2' 'imagemagick' 'perl-image-exiftool')
source=("https://github.com/firstlook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5874a7b76be15ccaa4c20874299ef51fbaf520a858229a58678bc72a305305fc')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  sed -i '1 s/python/python2/g' pdf-redact-tools
  install -Dm755 pdf-redact-tools "${pkgdir}/usr/bin/pdf-redact-tools"
}
# vim:set ts=2 sw=2 et:
