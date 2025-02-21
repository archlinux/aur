# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.24.6
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
sha256sums=('8ecb703c3dbde4292205d6408043a60e84dc06e14c7f944e6f7c1e2191e02320')
b2sums=('f6409a500a56b6eacb0d9805e8a2732cd7c88652ac54b672c3d27e3ae599b67c2c0c781cf90b64ecf7085bf8d02b6401af0ec397449af486fc03354481e11053')
