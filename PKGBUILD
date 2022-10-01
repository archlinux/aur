# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.15.0b2
_pkgver=3.15.0.2
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
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('06a58016b17434f5285d3a67fdc8a96524e062168545b4cb27d15a15ab416f0e')
b2sums=('ac4cf0d6836a40a3b1253b0ecc3378cd11fbd9883f4a11acfe998e1f2dd125245a8da1a8bad6266295e23aa832aba238daa5cfe07a67d8a150ebd5721c9f1611')
