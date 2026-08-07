# Maintainer: Lazerbeak12345 on GitHub (contact me on mastodon)
# Previous maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.28.8
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
sha256sums=('09464eb0ebe662d596cfbcf576c708abff13e4dd008e2a8083e9db5d32f7dbe7')
b2sums=('f9ed784a129a4b41b0000197dbafbd7da453a1728e2747a14064c4062bd6150ccb23b3fc4440e546bdbc047ce91f5fd9077ac84fe0686ea6e332b9e590717988')
