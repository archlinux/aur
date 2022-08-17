# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.14.4
_pkgver=3.14.4
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver%%_*}/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('5913132547882da16679828e8c1bdee9c454d37613c1ab824394c68da296e45b')
b2sums=('bcc07cc5bf9dca29231287b12baa3c7af1938fefd1a29ef2b0f522e325baa8c1667b9177e30c86eb2ec8207acb6a06240ac574cc3ded6b590b45bf16953a036d')
