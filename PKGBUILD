# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.14.2b_rc1
_pkgver=3.14.0.2
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
sha256sums=('98f299723a16fada1025b194b49efa11dc6c85690733e4b3992f44f1fdecb653')
b2sums=('c62b89959a8bf3153b712c3f933d0b3bb4d030187687bd93e5525a842a61545c76f649475acdfe08a4d97c59aca4caeea964fbd655959aa37531a0811e795a17')
