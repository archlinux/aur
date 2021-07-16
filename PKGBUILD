# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.11.2_rc2
_pkgver=3.11.2
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$_pkgver/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('fa95596a3281869ce5df17064ed14d289443c21404eaf86c52111e31b3277a3b')
b2sums=('0491cd4aacfd700187ee3e2422926bef4f711b7b0617b8a0c52ee6622afb513bdb9f8e1091d7ddd627a9e4b2580bb9ee0c30cd264d3b380676fd01e3a62037cd')
