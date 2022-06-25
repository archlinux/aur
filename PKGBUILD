# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.14.1b_rc1
_pkgver=3.14.0.1
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
sha256sums=('86416ffba7cba3bdfca8aa367bd09923a419f848c8ea832f0d6dd692b50c5aa5')
b2sums=('31c91ae4cc3d44aaaf468f33afad0583ef05140ad2fe9a3ee7d851ba413fa62adc32b73414c226a7da4f12e01458433afc4eefe1f5595145070598500a7bb520')
