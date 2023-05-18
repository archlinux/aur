# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.16.3.5
_pkgver=3.16.3b5
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('c3479e9817056788b330d4d911c607ba2b7e3b2516995448c8d4fd17f0a8c4d5')
b2sums=('3917a1bac7ecec91198a8e3f892803b1dcc547607eb5f7e9acc347910d3634eeaf045c25cfc16f190f07d020daa75c96ebcf4c7e396ea091efb64029a25cd892')
