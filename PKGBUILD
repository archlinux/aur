# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=1049925
pkgname=firefox-passff
pkgver=1.5
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}-an+fx-linux.xpi")
sha384sums=('841eda8771473324e0707c6f5341a5602b80030ddc443a2971967c7ea1975d32ba9b0a42ad443c7661f578aed575532a')

package() {
    install -Dm644 "${_pkgname}-${pkgver}-an+fx-linux.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}
