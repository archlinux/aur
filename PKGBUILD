# Maintainer: Yurii <yu hrysh at posteo dot net>

pkgname=chromium-extension-adnauseam
pkgver=3.10.4
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
sha256sums=('b49212829e7cab556aa860fa34764ba9a736cea840378debda098e4fe10a8f86')
b2sums=('2edadf25ad63ac0e69abcefc99f89735f73799851c2403f6f3ce3415e7fe22b9206fa2574d8184ff6f6e2daed3d63c898db19bab2b6c2a3d7669469d32890bfe')
