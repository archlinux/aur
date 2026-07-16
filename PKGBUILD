# Maintainer: Lazerbeak12345 on GitHub (contact me on mastodon)
# Previous maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.28.6
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
sha256sums=('b8ba79d2901a11865b4d00fb13829f7ee485a81ab3ea18c4dd925d63fe676e7f')
b2sums=('a803fa2bb4eb465b59bb9794912266386c768ebf6173d56365cab06778507b88623982010139bef227e71c9949c4d9a739a4b435dadb064f05b25fd1e51f7dda')
