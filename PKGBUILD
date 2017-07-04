# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=hex-unifont
pkgver=10.0.02
pkgrel=1
pkgdesc="GNU Unifont Glyphs, .hex format"
arch=('any')
license=('custom' 'GPL2')
url="http://unifoundry.com/unifont.html"
source=("http://unifoundry.com/pub/unifont-${pkgver}/font-builds/unifont-${pkgver}.hex.gz" 'LICENSE')
sha1sums=('696139c1282cf0a51c3df5a1a8882fc5ec619d7c'
          'e4ba558b4af9b8ab0f129c1f1788e168e412b9be')

package() {
  install -Dm644 "${srcdir}/unifont-${pkgver}.hex" \
    "${pkgdir}/usr/share/unifont/unifont.hex"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
