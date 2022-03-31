# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=chromium-extension-adnauseam
pkgver=3.12.2
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
sha256sums=('7cfcce026c6da1840c76ef01397bd2fbaca15695d8a9a0529fdc328f1332bf22')
b2sums=('698538ab793cb97cfb4b9e19da4f1133d98989286f7ea29236ceea58c365ffcc260e6c1dd8e871c47da53ffba272b7ba59ff7a240f161923ed02c3d1b2c8ed84')
