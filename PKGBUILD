# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.16.2
_pkgver=3.16.2.0
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
sha256sums=('d7601fd15931c5da00c92658665798b04fcb1c4227e2cf1b68192931bac70e23')
b2sums=('87a6f83bfb535f2e7d1042270c89c0cb182e185ab14b7959ade994cc8f6368ea058997c3a8ae8673333ee669566e383c8066786df556bc6bdb22b3286536f2e6')
