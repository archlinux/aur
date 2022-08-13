# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.14.3b_rc3
_pkgver=3.14.0.3
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
sha256sums=('eba30bc0f3c7802233a639e466f41c16dc933fd9fb1eca82f2742d164d87b865')
b2sums=('0e5021f8ba365bb2d0f3caed70ca01f12285feef3f0a09f6fc885bdcc4791b7e5d4b24e006cde8c296507b52a9b440431f18dc92fafdc5165ab36832099464c9')
