# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff
pkgver=1.9.1
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
_file_id=3454648
_file_name="${_pkgname}-${pkgver}-fx.xpi"
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_file_name}")
noextract=("${_file_name}")

package() {
    install -Dm644 "${_file_name}" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}

sha384sums=('a470ef57f843fde4f82e8f5f077591403c71c671d4ae3862290132fb80a33f833b8f8aeaad85886d55bfb9b3336b8707')
