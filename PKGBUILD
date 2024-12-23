# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.24.0
_pkgver="$pkgver"
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL-3.0-only')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('dd261e96008e4510ef201addeab729e9be2a40d0474d30c9aa537e6d823a9e30')
b2sums=('69d881ba7adb2d105e51ef25c0d6fefeef73f8d636489531505bae679cc9c80bf946395a0a0cf46b4cc91046932b91e23a67a70a9fffad75d896b8bf2dcbe5af')
