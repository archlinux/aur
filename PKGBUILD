# Maintainer: Lazerbeak12345 on GitHub (contact me on mastodon)
# Previous maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.29.2
_pkgver="$pkgver"
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL-3.0-only')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser"
            "brave-bin: Popular fork of chromium"
            "brave-origin-bin: Popular fork of chromium, without some features"
            "brave-nightly-bin: Popular fork of chromium (nightly release)"
            "brave-origin-nightly-bin: Popular fork of chromium, without some features (nightly release)"
            "brave-beta-bin: Popular fork of chromium (beta release)"
            "brave-origin-beta-bin: Popular fork of chromium, without some features (beta release)")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('2c7241dbd1ec71b16f2f8883830595b74e2603896f3f283ad500b070edbc9ac1')
b2sums=('d1f1507db66ee641b71fee14401126e8a41522a4a9928d5d4928a79b298697162d881ec39d8051b0b620e9d6a66010c8ff3ffd3c9fd7434b883dd6014d0416b4')
