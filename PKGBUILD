# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=chromium-extension-adnauseam
pkgver=3.26.0
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
sha256sums=('c4497ea04c5e6474e5620e1a0f995db52029fb7bd22afcf1f672b6f374909ab4')
b2sums=('2bd6fb84d0977d01b42197a24e1851764b693d1d5d5530e2670a4f6fbca732b08c0479361671ecc0d7d056c25f6ba9cb4e2a84267da7e9e96063aed629fc58a7')
