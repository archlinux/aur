# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.21.0
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
sha256sums=('690c231ebc0b0aa8fd9cb25f5b31c7ba0e369ddf6590857f79432c7791678c44')
b2sums=('cca5ff05ce76c5cf95ade522d2d8e50ad91a29b63a6cdd069f658a8f654fe8e846962f63c94f54f4898e134d0c71891ffd2177f6623d2d6e9580a677b5dfcf89')
