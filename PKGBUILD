# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.14.5
_pkgver=3.14.5
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
sha256sums=('f0da9a5f4131ad1fd7234cfef979372d7d084b08275da1be05e69f09cb045b27')
b2sums=('75fa8cdba19ce2460d9dced4f03531b71039b71abfcbc21c5a945d062e42c0678800767ad9e18549168e3ab6f4535680d51a4293a223b1ca7cd707e7e41a5776')
