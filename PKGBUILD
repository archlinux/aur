# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.15.4b_rc1
_pkgver=3.15.0.4
_tag=v3.15.0b4
pkgrel=1
pkgdesc='An ad-blocker which silently simulates clicks on each blocked ad, confusing trackers'
arch=('any')
url='https://adnauseam.io'
license=('GPL3')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install=$pkgname.install
source=("https://github.com/dhowe/AdNauseam/releases/download/$_tag/adnauseam-$_pkgver.chromium.zip")

package() {
   mkdir -p "$pkgdir/usr/share/$pkgname"
   cp -dr --no-preserve=ownership $srcdir/adnauseam.chromium/* "$pkgdir/usr/share/$pkgname/"
}
sha256sums=('d18d711df17efff35edde3af795fcda4b2bcb04f3af369d9a629a552d20c3b90')
b2sums=('ca60206ecde945c36ad9ef4f9bd7e11359b70fbb7fdadefbe7f14004312ccbc63d9a3d1cfcd23845182d3afea4dafc62ec5848515745b8c144b53bbb0b29b1dd')
