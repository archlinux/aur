# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.13.1
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/v$pkgver/adnauseam-$pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership "$srcdir/adnauseam.chromium"/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('8f3f751f2fa27ba13a90d8a04b6206757b77eb68656e7c642bb025855d30c6bf')
b2sums=('14d826b67d10ef3c3c9cd83d24e0b2ef9e88d28a5c95adca8713f7269df593fb29557318461f7dde0f732eb75405b21a3623518b9a22ec34ec56d5055ff3c76c')
