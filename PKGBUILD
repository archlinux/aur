# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.12.1
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
sha256sums=('8da51a13a9f6f69b135d40a0fb2e1b316a6d6fd440f6344411268e2aa9f2940b')
b2sums=('25b7a047949f2bbe1c5982fcaaa9f2a9635fdeff6fc5d5537373f5d11cd4a92afba892817b153a0b9e5132d515200f7083a55623ff1e47109ee49bb3b034d7be')
