# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.15.2b3_rc3
_pkgver=3.15.2.3
pkgrel=1
epoch=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v${pkgver%_*}/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('477f9250458f9ad9a880825214e34f15798137292d0a0482bea60f8fbbfcc18e')
b2sums=('3203709b6be5dedd5a84fa227c760e6d20e8b1b5ca3524f5e2e6f8620eff7d8d68892348d5d0b2993f17d9697563923d1e8fb8ca27ec74f24e1960e4b7830478')
