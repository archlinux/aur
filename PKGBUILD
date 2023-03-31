# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.16.3.0
_pkgver=3.16.3b0
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
sha256sums=('8d6ace0a82adb2a17007df5e39c5cb57da6b323d6b8a9360a2dc25c5e165b18a')
b2sums=('e6dd8b177749ae37ff938c7fac215a1161196144f3db5dd43e98e128d8a5ec78bfb6bed55d60bce64ea0e8389860b7523c1216f54b6c9b17b82ad5f647f7b152')
