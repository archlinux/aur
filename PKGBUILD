# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=904741
pkgname=firefox-passff
pkgver=1.3b
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}-an+fx-linux.xpi")
sha384sums=('6854e30b798b6709bb71c65215efadfcda159fb172e02a38e34facb113fe8c36059721ecc849c5067bf79e1c4dbb97ee')

package() {
    install -Dm644 "${_pkgname}-${pkgver}-an+fx-linux.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}
