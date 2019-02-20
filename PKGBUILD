# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff
pkgver=1.6.3
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
_file_id=1681210
_file_name="${_pkgname}-${pkgver}-fx.xpi"
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_file_name}")
noextract=("${_file_name}")

package() {
    install -Dm644 "${_file_name}" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}

sha384sums=('71f05b87c1e9e44f7a97ee21787b4f901b4cc0a24bcbd4691716b27b5d8690300a20aaee1670d36be4907a4265b0b7ca')
