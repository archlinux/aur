# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff
pkgver=1.10
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'pass' 'passff-host')
_file_id=3584906
_file_name="${_pkgname}-${pkgver}-fx.xpi"
source=("https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_file_name}")
noextract=("${_file_name}")

package() {
    install -Dm644 "${_file_name}" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/passff@invicem.pro.xpi"
}

sha384sums=('bb1a8418fcd879416832c9bfa44bfc3e1bb239795273bc98e728b570a91f5db80f9637e7e4e58fa5ee6146e622f27206')
