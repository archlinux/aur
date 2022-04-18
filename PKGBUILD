# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.13.0.1
_repover=v3.13.0rc1
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/$_repover/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('93bb33eeafc46bdc881ab0bf3e480ab05eacda71b5f607d4ffaaa8f1e8463207')
b2sums=('fc4fe697f1d7b8ca5e647bca270d21d7daae406963f6f597007de30e12b92ede6088a40df5a2b12e1f80686d08d3ff6ece3cf16be7a1e20fbfc790021d3e43cf')
