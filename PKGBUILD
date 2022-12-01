# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.15.2b0_rc1
_pkgver=3.15.2.0
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
sha256sums=('e8127f1ac50ba2f1559620da47b336a6266f7d7072e9c9f12c024f49f15df08f')
b2sums=('85bff2bc77b818f9908b09d573a3f86f1a4776a04dcbd959237f72b0f33ea5d94a2854be57aa1088cababef51ce7b597749e095d2163552b9ebd7efccb8b5135')
