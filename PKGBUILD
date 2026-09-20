# Maintainer: Lazerbeak12345 on GitHub (contact me on mastodon)
# Previous maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.29.0
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
sha256sums=('02502898d6116d73fca41e92f5331d2e5f35ba3b4c049a90736a8aa2ae54b40f')
b2sums=('a8dcbd37f2d2ef4f227e62e19b6a6c4aa2830cd75a6f2e06eacca36fd8979df497dd1d3db76b1607f2904815bbeaafcdc34ce7a6fc6c4597f3b1c5238f4a3c3c')
