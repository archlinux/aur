# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.16.0
_pkgver=$pkgver
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver%_*}/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('cb534f8d4551ea71951d7bccf2e5d5e1420b4d9a23d208b92f65aa743c0651c3')
b2sums=('2645eaec6023667c75cbb9876968c11fb11d1e3959d88aeaf4a2415876ec465228d8d8f439993a987dda5a17a40c8ca952ccd666bf977eaa6b958c4ce48fb75f')
