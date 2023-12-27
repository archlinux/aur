# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

_name=blocktube
_id="{58204f8b-01c2-4bbc-98f8-9a90458fd9ef}"

pkgname="firefox-$_name"
pkgver=0.3.38
pkgrel=1
pkgdesc="YouTube content blocker."
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/$_name/"
license=('GPL3')
depends=('firefox')
groups=('firefox-addons')
source=("$_name-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/latest/$_name/latest.xpi")
sha256sums=('09e79457ecf19596570fdef9f90d4374861785738f71d3558b013be7208477d2')

package() {
    cd "$srcdir"
    install -Dm644 ${_name}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/${_id}.xpi"
}