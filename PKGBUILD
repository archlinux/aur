# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=1056515
pkgname=firefox-passff
pkgver=1.5.1
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}-an+fx-linux.xpi")

package() {
    install -Dm644 "${_pkgname}-${pkgver}-an+fx-linux.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}

sha384sums=('574f2df7fe3a722c3baa4bdecdca5bcb165e3c464d8e581cc119f20082ef768a8fe562daa50b7f03539e244772e3c9ae')
