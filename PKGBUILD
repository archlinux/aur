# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.15.0b3
_pkgver=3.15.0.3
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
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('09a5dbb97d692aedf7350a3b0e38fe813ecd83bbeda8b47c8a4cc8b52e8a4ec2')
b2sums=('1ae685797450b9e96f6fb04add578728033cc941cc0dc60c328380a324f64e166bdbf3dae7edb23e1a0901949abbe50cd4f322e0f7013f184f4eb6716b4f3f5d')
