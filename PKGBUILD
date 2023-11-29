# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

_file=blocktube_firefox_selfhosted
_id="blocktube@git"

pkgname=firefox-blocktube
pkgver=0.3.38
pkgrel=1
pkgdesc="Filter and block unwanted content from YouTube."
arch=('any')
url='https://github.com/amitbl/blocktube'
license=('GPL3')
groups=('firefox-addons')
source=("$url/releases/download/v$pkgver/$_file.xpi")
sha256sums=('b08b40a8d7511d03e76b3c43035187a2663f230e389543b460a0805a000b1aec')

package() {
    cd "${srcdir}"
    install -Dm644 ${_file}.xpi '${pkgdir}/usr/lib/firefox/browser/extensions/${_id}.xpi'
}